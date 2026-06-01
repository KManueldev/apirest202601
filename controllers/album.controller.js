const { response } = require('express');
const LaminasPanini = require('../models/mySqlLamina');
const Coleccion = require('../models/mySqlColeccion');
const Intercambio = require('../models/mySqlIntercambio');

const getAlbum = async (req, res = response) => {
    const usuario = req.usuario;
    try {
        const { sequelize } = require('../database/MySqlConnection');
        
        // Query con JOIN para obtener el grupo desde paises_mundial_2026
        const laminas = await sequelize.query(`
            SELECT 
                l.id,
                l.nombre_sticker,
                l.foto_url,
                l.equipo_actual,
                l.posicion,
                l.es_especial,
                l.fecha_nacimiento,
                l.estatura_cm,
                l.peso_kg,
                l.iso3,
                p.grupo,
                p.pais AS pais
            FROM laminas_panini_2026 l
            LEFT JOIN paises_mundial_2026 p ON l.iso3 = p.iso3
            ORDER BY l.id ASC
        `, { type: sequelize.QueryTypes.SELECT });
        
        // Obtener todas las láminas que el usuario posee
        const coleccionUsuario = await Coleccion.findAll({
            where: { usuario_id: usuario.id, estado: 'poseida' },
            attributes: ['lamina_id'],
        });
        
        const laminasPoseidas = coleccionUsuario.map(c => c.lamina_id);
        
        // Cruzar todas las láminas con el inventario del usuario
        const album = laminas.map(lamina => ({
            id: lamina.id,
            nombre_sticker: lamina.nombre_sticker,
            foto_url: lamina.foto_url,
            equipo_actual: lamina.equipo_actual,
            posicion: lamina.posicion,
            es_especial: lamina.es_especial,
            fecha_nacimiento: lamina.fecha_nacimiento,
            estatura_cm: lamina.estatura_cm,
            peso_kg: lamina.peso_kg,
            iso3: lamina.iso3,
            grupo: lamina.grupo,
            pais: lamina.pais,
            posee: laminasPoseidas.includes(lamina.id),
            color: laminasPoseidas.includes(lamina.id) ? 'verde' : 'gris',
        }));
        
        res.json({ ok: true, data: album });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error obteniendo el álbum', error: error.message });
    }
};

const getProgreso = async (req, res = response) => {
    const usuario = req.usuario;
    try {
        const totalLaminas = await LaminasPanini.count();
        const poseidas = await Coleccion.count({ where: { usuario_id: usuario.id, estado: 'poseida' } });
        const faltantes = totalLaminas - poseidas;
        const porcentaje = totalLaminas ? Math.round((poseidas / totalLaminas) * 100) : 0;
        
        res.json({
            ok: true,
            progreso: {
                total: totalLaminas,
                poseidas: poseidas,
                faltantes: faltantes,
                porcentaje: porcentaje,
                mensaje: `Tienes ${poseidas}/${totalLaminas} láminas (${porcentaje}%)`,
                progreso_visual: {
                    barra: Array(porcentaje).fill('█').join('') + Array(100 - porcentaje).fill('░').join(''),
                    porcentaje_display: `${porcentaje}%`
                }
            },
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error obteniendo el progreso', error: error.message });
    }
};

const getColeccion = async (req, res = response) => {
    const usuario = req.usuario;
    try {
        const coleccionItems = await Coleccion.findAll({
            where: { usuario_id: usuario.id, estado: 'poseida' },
        });

        const laminaIds = coleccionItems.map((item) => item.lamina_id);
        if (laminaIds.length === 0) {
            return res.json({ ok: true, data: [] });
        }

        const laminas = await LaminasPanini.findAll({
            where: { id: laminaIds },
            order: [['id', 'ASC']],
        });

        const coleccion = laminas.map((lamina) => ({
            id: lamina.id,
            nombre_sticker: lamina.nombre_sticker,
            foto_url: lamina.foto_url,
            posicion: lamina.posicion,
            estado: 'poseida',
        }));

        res.json({ ok: true, data: coleccion });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error obteniendo la colección', error: error.message });
    }
};

const addLamina = async (req, res = response) => {
    const usuario = req.usuario;
    const { lamina_id } = req.body;

    if (!lamina_id) {
        return res.status(400).json({ ok: false, msg: 'La lámina es obligatoria' });
    }

    try {
        const lamina = await LaminasPanini.findByPk(lamina_id);
        if (!lamina) {
            return res.status(404).json({ ok: false, msg: 'Lámina no existe' });
        }

        const [registro, created] = await Coleccion.findOrCreate({
            where: { usuario_id: usuario.id, lamina_id },
            defaults: { estado: 'poseida' },
        });

        if (!created) {
            if (registro.estado === 'poseida') {
                return res.status(400).json({ ok: false, msg: 'La lámina ya está en la colección' });
            }
            registro.estado = 'poseida';
            await registro.save();
        }

        res.json({ ok: true, msg: 'Lámina registrada en la colección', data: registro });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error registrando la lámina', error: error.message });
    }
};

const addIntercambiable = async (req, res = response) => {
    const usuario = req.usuario;
    const { lamina_id } = req.body;

    if (!lamina_id) {
        return res.status(400).json({ ok: false, msg: 'La lámina es obligatoria' });
    }

    try {
        const lamina = await LaminasPanini.findByPk(lamina_id);
        if (!lamina) {
            return res.status(404).json({ ok: false, msg: 'Lámina no existe' });
        }

        const coleccion = await Coleccion.findOne({ where: { usuario_id: usuario.id, lamina_id } });
        if (coleccion && coleccion.estado === 'poseida') {
            return res.status(400).json({ ok: false, msg: 'No puedes intercambiar una lámina que ya está en tu colección' });
        }

        const [registro, created] = await Intercambio.findOrCreate({
            where: { usuario_id: usuario.id, lamina_id },
            defaults: { estado: 'intercambiable' },
        });

        if (!created) {
            return res.status(400).json({ ok: false, msg: 'La lámina ya está en tu lista de intercambiables' });
        }

        res.json({ ok: true, msg: 'Lámina agregada a intercambiables', data: registro });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error agregando lámina intercambiable', error: error.message });
    }
};

const getIntercambiables = async (req, res = response) => {
    const usuario = req.usuario;
    try {
        const intercambios = await Intercambio.findAll({ where: { usuario_id: usuario.id, estado: 'intercambiable' } });
        res.json({ ok: true, data: intercambios });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error obteniendo intercambiables', error: error.message });
    }
};

const getIntercambioVirtual = async (req, res = response) => {
    const usuario = req.usuario;
    const { otroUsuarioId } = req.params;

    try {
        const usuarioIntercambio = await Intercambio.findAll({ where: { usuario_id: usuario.id, estado: 'intercambiable' } });
        const otroIntercambio = await Intercambio.findAll({ where: { usuario_id: otroUsuarioId, estado: 'intercambiable' } });

        const mio = usuarioIntercambio.map((item) => item.lamina_id);
        const otro = otroIntercambio.map((item) => item.lamina_id);

        const puedoPedir = otro.filter((id) => !mio.includes(id));
        const puedoOfrecer = mio.filter((id) => !otro.includes(id));

        res.json({
            ok: true,
            data: {
                usuario_id: usuario.id,
                otro_usuario_id: otroUsuarioId,
                puedo_pedir: puedoPedir,
                puedo_ofrecer: puedoOfrecer,
                encuentro: 'Acordar punto físico o envío por correo en el mismo país',
            },
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error en intercambio virtual', error: error.message });
    }
};

const getIntercambiosInfo = async (req, res = response) => {
    const usuario = req.usuario;
    try {
        const intercambios = await Intercambio.findAll({ where: { usuario_id: usuario.id } });
        res.json({ ok: true, data: intercambios });
    } catch (error) {
        console.error(error);
        res.status(500).json({ ok: false, msg: 'Error obteniendo información de intercambios', error: error.message });
    }
};

module.exports = {
    getAlbum,
    getProgreso,
    getColeccion,
    addLamina,
    addIntercambiable,
    getIntercambiables,
    getIntercambioVirtual,
    getIntercambiosInfo,
};
