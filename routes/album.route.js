const { Router } = require('express');
const { validarJWT } = require('../middlewares/validar-jwt');
const {
    getAlbum,
    getAlbumGroup,
    getProgreso,
    getColeccion,
    addLamina,
    addIntercambiable,
    getIntercambiables,
    getIntercambioVirtual,
    getIntercambiosInfo,
} = require('../controllers/album.controller');

const router = Router();

// Obtener todas las láminas del mundial cruzadas con el inventario del usuario
router.get('/laminas', validarJWT, getAlbum);

// Obtener todas las láminas para un solo grupo
router.get('/grupo/:letter', validarJWT, getAlbumGroup);

// Obtener progreso del usuario en el álbum
router.get('/progreso', validarJWT, getProgreso);

// Obtener la colección completa del usuario
router.get('/coleccion', validarJWT, getColeccion);

// Agregar lámina a la colección personal
router.post('/coleccion', validarJWT, addLamina);

// Agregar lámina a intercambiables
router.post('/intercambiables', validarJWT, addIntercambiable);

// Obtener lista de láminas intercambiables del usuario
router.get('/intercambiables', validarJWT, getIntercambiables);

// Obtener intercambio virtual con otro usuario
router.get('/intercambio-virtual/:otroUsuarioId', validarJWT, getIntercambioVirtual);

// Obtener información de intercambios
router.get('/intercambios', validarJWT, getIntercambiosInfo);

module.exports = router;
