const { Router } = require('express');
const { validarJWT } = require('../middlewares/validar-jwt');
const { buscarMatch, crearPropuesta, acordar, confirmar } = require('../controllers/intercambio.controller');

const router = Router();

router.get('/buscar-match', validarJWT, buscarMatch);
router.post('/propuesta', validarJWT, crearPropuesta);
router.put('/:id/acordar', validarJWT, acordar);
router.post('/:id/confirmar', validarJWT, confirmar);

module.exports = router;
