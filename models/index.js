const Server = require('./server');
//const Usuario = require('./mongoUsuario.model');
const Usuario = require('./mySqlUsuario');
const Heroe = require('./mySqlHeroes');
const Lamina = require('./mySqlLamina');
const Coleccion = require('./mySqlColeccion');
const Intercambio = require('./mySqlIntercambio');
const Lamina = require('./mySqlLamina');
const Coleccion = require('./mySqlColeccion');
const Intercambio = require('./mySqlIntercambio');


module.exports = {
    Server,
    Usuario,
    Heroe,
    Lamina,
    Coleccion,
    Intercambio,
}
