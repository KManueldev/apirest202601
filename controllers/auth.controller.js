const { response } = require("express");
const bcryptjs = require("bcryptjs");
const { generarJWT } = require("../helpers/generar-jwt");
const Usuario = require("../models/mySqlUsuario");


const login = async (req, res = response) => {
    const { correo, password } = req.body;


    try {
        const usuario = await Usuario.findOne({
            where: {
                correo,
            },
        });

        if (!usuario) {
            return res.status(400).json({
                ok: false,
                msg: "Usuario / Password no son correctos - correo: " + correo,
            });
        }

        if (!usuario.estado) {
            return res.status(400).json({
                ok: false,
                msg: "Usuario / Password no son correctos - estado: false",
            });
        }

        const validaPassword = bcryptjs.compareSync(password, usuario.password);
        if (!validaPassword) {
            return res.status(400).json({
                ok: false,
                msg: "Usuario / Password no son correctos - password",
            });
        }

        const token = await generarJWT(usuario.id);

        res.json({
            ok: true,
            msg: "Login ok",
            usuario: {
                id: usuario.id,
                nombre: usuario.nombre,
                correo: usuario.correo,
                rol: usuario.rol,
            },
            token,
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: "Hable con el Administrador...",
            error: error,
        });
    }
};




const register = async (req, res = response) => {
    const { nombre, correo, password, rol, pais } = req.body;

    try {
        // Verificar si el correo ya existe
        const usuarioExistente = await Usuario.findOne({
            where: {
                correo,
            },
        });

        if (usuarioExistente) {
            return res.status(400).json({
                ok: false,
                msg: "El correo ya está registrado",
            });
        }

        // Encriptar contraseña
        const salt = bcryptjs.genSaltSync(10);
        const passwordEncriptada = bcryptjs.hashSync(password, salt);

        // Crear nuevo usuario
        const nuevoUsuario = await Usuario.create({
            nombre,
            correo,
            password: passwordEncriptada,
            rol: rol || 'USER_ROLE',
            pais: pais || null,
            estado: true,
        });

        // Generar JWT
        const token = await generarJWT(nuevoUsuario.id);

        res.status(201).json({
            ok: true,
            msg: "Usuario creado correctamente",
            usuario: {
                id: nuevoUsuario.id,
                nombre: nuevoUsuario.nombre,
                correo: nuevoUsuario.correo,
                rol: nuevoUsuario.rol,
                pais: nuevoUsuario.pais,
            },
            token,
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: "Hable con el Administrador...",
            error: error.message,
        });
    }
};

const getProfile = async (req, res = response) => {
    try {
        const usuario = req.usuario; // Viene del middleware validarJWT

        res.json({
            ok: true,
            usuario: {
                id: usuario.id,
                nombre: usuario.nombre,
                correo: usuario.correo,
                rol: usuario.rol,
                pais: usuario.pais,
                img: usuario.img,
                estado: usuario.estado,
            },
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: "Hable con el Administrador...",
            error: error.message,
        });
    }
};

const updateProfile = async (req, res = response) => {
    const { nombre, correo, img, rol, pais } = req.body;
    const usuario = req.usuario; // Del middleware JWT

    try {
        // Verificar si el nuevo correo ya existe (si cambió)
        if (correo && correo !== usuario.correo) {
            const correoExistente = await Usuario.findOne({
                where: { correo },
            });
            if (correoExistente) {
                return res.status(400).json({
                    ok: false,
                    msg: "El correo ya está en uso",
                });
            }
        }

        // Actualizar usuario
        await Usuario.update(
            {
                nombre: nombre || usuario.nombre,
                correo: correo || usuario.correo,
                img: img !== undefined ? img : usuario.img,
                rol: rol || usuario.rol,
                pais: pais !== undefined ? pais : usuario.pais,
            },
            {
                where: { id: usuario.id },
            }
        );

        // Obtener el usuario actualizado
        const usuarioFinal = await Usuario.findByPk(usuario.id);

        res.json({
            ok: true,
            msg: "Perfil actualizado correctamente",
            usuario: {
                id: usuarioFinal.id,
                nombre: usuarioFinal.nombre,
                correo: usuarioFinal.correo,
                rol: usuarioFinal.rol,
                img: usuarioFinal.img,
                estado: usuarioFinal.estado,
            },
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: "Hable con el Administrador...",
            error: error.message,
        });
    }
};

const deleteProfile = async (req, res = response) => {
    const usuario = req.usuario; // Del middleware JWT

    try {
        // "Eliminar" usuario marcando estado: false (soft delete)
        await Usuario.update(
            { estado: false },
            { where: { id: usuario.id } }
        );

        res.json({
            ok: true,
            msg: "Perfil eliminado correctamente",
        });
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: "Hable con el Administrador...",
            error: error.message,
        });
    }
};

module.exports = {
    login,
    register,
    getProfile,
    updateProfile,
    deleteProfile,
}