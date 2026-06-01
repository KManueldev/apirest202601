const { response } = require('express');
const { QueryTypes } = require('sequelize');
const { bdmysql } = require('../database/MySqlConnection');
const Usuario = require('../models/mySqlUsuario');
const Intercambio = require('../models/mySqlIntercambio');
const Coleccion = require('../models/mySqlColeccion');
const PropuestaIntercambio = require('../models/mySqlPropuestaIntercambio');

const buscarMatch = async (req, res = response) => {
    const usuarioId = req.usuario.id;
    try {
        const query = `
            SELECT u.id AS usuario_id,
                   u.nombre,
                   u.correo,
                   GROUP_CONCAT(DISTINCT i_tienen.lamina_id SEPARATOR ',') AS pueden_darme,
                   GROUP_CONCAT(DISTINCT i_necesitan.lamina_id SEPARATOR ',') AS pueden_recibir
            FROM usuarios u
            LEFT JOIN intercambios_panini i_tienen
              ON i_tienen.usuario_id = u.id
             AND i_tienen.estado = 'intercambiable'
             AND i_tienen.lamina_id IN (
                 SELECT l.id FROM laminas_panini_2026 l
                  WHERE NOT EXISTS (
                      SELECT 1 FROM colecciones_panini c
                       WHERE c.usuario_id = :usuarioId
                         AND c.lamina_id = l.id
                         AND c.estado = 'poseida'
                  )
             )
            LEFT JOIN intercambios_panini i_necesitan
              ON i_necesitan.usuario_id = u.id
             AND i_necesitan.estado = 'intercambiable'
             AND i_necesitan.lamina_id IN (
                 SELECT i.lamina_id FROM intercambios_panini i
                  WHERE i.usuario_id = :usuarioId
                    AND i.estado = 'intercambiable'
             )
            WHERE u.id != :usuarioId
            GROUP BY u.id
            HAVING pueden_darme IS NOT NULL AND pueden_recibir IS NOT NULL;
        `;

        const matches = await bdmysql.query(query, {
            replacements: { usuarioId },
            type: QueryTypes.SELECT,
        });

        const resultados = matches.map((match) => ({
            usuario_id: match.usuario_id,
            nombre: match.nombre,
            correo: match.correo,
            pueden_darme: match.pueden_darme ? match.pueden_darme.split(',') : [],
            pueden_recibir: match.pueden_recibir ? match.pueden_recibir.split(',') : [],
        }));

        return res.json({ ok: true, data: resultados });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ ok: false, msg: 'Error buscando match de intercambio', error: error.message });
    }
};

const crearPropuesta = async (req, res = response) => {
    const usuarioA = req.usuario;
    const { usuario_b_id, laminas_a, laminas_b } = req.body;

    if (!usuario_b_id || !Array.isArray(laminas_a) || !Array.isArray(laminas_b)) {
        return res.status(400).json({ ok: false, msg: 'usuario_b_id, laminas_a y laminas_b son obligatorios' });
    }

    if (usuarioA.id === usuario_b_id) {
        return res.status(400).json({ ok: false, msg: 'No puedes crear una propuesta contra ti mismo' });
    }

    try {
        const usuarioB = await Usuario.findByPk(usuario_b_id);
        if (!usuarioB) {
            return res.status(404).json({ ok: false, msg: 'Usuario B no encontrado' });
        }

        const repetidasA = await Intercambio.findAll({
            where: { usuario_id: usuarioA.id, estado: 'intercambiable' },
        });
        const idsA = repetidasA.map((item) => item.lamina_id);

        const repetidasB = await Intercambio.findAll({
            where: { usuario_id: usuario_b_id, estado: 'intercambiable' },
        });
        const idsB = repetidasB.map((item) => item.lamina_id);

        const faltantesA = laminas_a.filter((lamina) => !idsA.includes(lamina));
        const faltantesB = laminas_b.filter((lamina) => !idsB.includes(lamina));

        if (faltantesA.length > 0) {
            return res.status(400).json({ ok: false, msg: 'Las siguientes láminas no están disponibles como repetidas del usuario A', faltantesA });
        }

        if (faltantesB.length > 0) {
            return res.status(400).json({ ok: false, msg: 'Las siguientes láminas no están disponibles como repetidas del usuario B', faltantesB });
        }

        const propuesta = await PropuestaIntercambio.create({
            usuario_a_id: usuarioA.id,
            usuario_b_id,
            laminas_a,
            laminas_b,
        });

        return res.status(201).json({ ok: true, msg: 'Propuesta creada', data: propuesta });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ ok: false, msg: 'Error creando la propuesta de intercambio', error: error.message });
    }
};

const acordar = async (req, res = response) => {
    const usuario = req.usuario;
    const { id } = req.params;
    const { tipo, detalle } = req.body;

    if (!tipo || !detalle) {
        return res.status(400).json({ ok: false, msg: 'tipo y detalle son obligatorios' });
    }

    if (!['postal', 'fisico'].includes(tipo)) {
        return res.status(400).json({ ok: false, msg: 'tipo debe ser postal o fisico' });
    }

    try {
        const propuesta = await PropuestaIntercambio.findByPk(id);
        if (!propuesta) {
            return res.status(404).json({ ok: false, msg: 'Propuesta no encontrada' });
        }

        if (usuario.id !== propuesta.usuario_a_id && usuario.id !== propuesta.usuario_b_id) {
            return res.status(403).json({ ok: false, msg: 'No tienes permisos para actualizar esta propuesta' });
        }

        if (tipo === 'postal') {
            const usuarioA = await Usuario.findByPk(propuesta.usuario_a_id);
            const usuarioB = await Usuario.findByPk(propuesta.usuario_b_id);
            const paisA = usuarioA.pais?.trim().toLowerCase();
            const paisB = usuarioB.pais?.trim().toLowerCase();

            if (!paisA || !paisB || paisA !== paisB) {
                return res.status(400).json({ ok: false, msg: 'Para envío postal ambos usuarios deben vivir en el mismo país' });
            }

            propuesta.tipo_logistica = 'postal';
            propuesta.detalle_logistica = detalle;
        } else {
            propuesta.tipo_logistica = 'fisico';
            propuesta.detalle_logistica = detalle;
        }

        await propuesta.save();

        return res.json({ ok: true, msg: 'Logística de intercambio actualizada', data: propuesta });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ ok: false, msg: 'Error acordando la logística del intercambio', error: error.message });
    }
};

const confirmar = async (req, res = response) => {
    const usuario = req.usuario;
    const { id } = req.params;

    try {
        const propuesta = await PropuestaIntercambio.findByPk(id);
        if (!propuesta) {
            return res.status(404).json({ ok: false, msg: 'Propuesta no encontrada' });
        }

        if (propuesta.estado !== 'pendiente') {
            return res.status(400).json({ ok: false, msg: 'La propuesta ya no está pendiente' });
        }

        const esA = usuario.id === propuesta.usuario_a_id;
        const esB = usuario.id === propuesta.usuario_b_id;

        if (!esA && !esB) {
            return res.status(403).json({ ok: false, msg: 'No tienes permisos para confirmar este intercambio' });
        }

        if (esA) propuesta.confirmado_a = true;
        if (esB) propuesta.confirmado_b = true;

        if (propuesta.confirmado_a && propuesta.confirmado_b) {
            await bdmysql.transaction(async (t) => {
                const laminasA = propuesta.laminas_a || [];
                const laminasB = propuesta.laminas_b || [];

                const intercambioA = await Intercambio.findAll({
                    where: { usuario_id: propuesta.usuario_a_id, estado: 'intercambiable', lamina_id: laminasA },
                    transaction: t,
                });
                const intercambioB = await Intercambio.findAll({
                    where: { usuario_id: propuesta.usuario_b_id, estado: 'intercambiable', lamina_id: laminasB },
                    transaction: t,
                });

                if (intercambioA.length !== laminasA.length || intercambioB.length !== laminasB.length) {
                    throw new Error('Alguna lámina ya no está disponible para intercambio');
                }

                await Intercambio.destroy({
                    where: { usuario_id: propuesta.usuario_a_id, lamina_id: laminasA },
                    transaction: t,
                });
                await Intercambio.destroy({
                    where: { usuario_id: propuesta.usuario_b_id, lamina_id: laminasB },
                    transaction: t,
                });

                await Promise.all([
                    ...laminasB.map((lamina_id) =>
                        Coleccion.findOrCreate({
                            where: { usuario_id: propuesta.usuario_a_id, lamina_id },
                            defaults: { estado: 'poseida' },
                            transaction: t,
                        })
                    ),
                    ...laminasA.map((lamina_id) =>
                        Coleccion.findOrCreate({
                            where: { usuario_id: propuesta.usuario_b_id, lamina_id },
                            defaults: { estado: 'poseida' },
                            transaction: t,
                        })
                    ),
                ]);

                propuesta.estado = 'aceptado';
                await propuesta.save({ transaction: t });
            });

            return res.json({ ok: true, msg: 'Intercambio confirmado y ejecutado', data: propuesta });
        }

        await propuesta.save();
        return res.json({ ok: true, msg: 'Confirmación registrada', data: propuesta });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ ok: false, msg: 'Error confirmando el intercambio', error: error.message });
    }
};

module.exports = {
    buscarMatch,
    crearPropuesta,
    acordar,
    confirmar,
};
