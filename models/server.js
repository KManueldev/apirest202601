const express = require('express')
const cors = require('cors')

const { bdmysql } = require('../database/MySqlConnection');

// Importar modelos para que Sequelize los registre
require('../models/mySqlUsuario');
require('../models/mySqlHeroes');
require('../models/mySqlPeliculas');
require('../models/mySqlProtagonista')
require('../models/mySqlQRLectura');
require('../models/mySqlLamina');
require('../models/mySqlColeccion');
require('../models/mySqlIntercambio');
require('../models/mySqlPropuestaIntercambio');

//const { dbConnectionMongo } = require('../database/MongoConnection');


class Server {

    constructor() {
        this.app = express();
        this.port = process.env.PORT;

        
        this.pathsMySql = {
            auth: '/api/auth',
            heroes: '/api/heroes',
            peliculas: '/api/peliculas',
            qrLecturas: '/api/qr-lecturas',
            album: '/api/album',
            intercambios: '/api/intercambios',
        }
            
        //this.pathsMongo = {

            //Ajusto la url para la outorizacion por login
            //auth: '/api/auth',
            //usuarios: '/api/usuarios',
        //}


        /*
        this.app.get('/', function (req, res) {
            res.send('Hola Mundo a todos... como estan...')
        })
        */    
        

        //Aqui me conecto a la BD
        this.dbConnection();
        //Aqui me conecto a MongoDB
        //this.conectarBDMongo();


        //Middlewares
        this.middlewares();


        //Routes
        this.routes();

        this.app.get('/api/album/debug', (req, res) => {
            res.json({ ok: true, msg: 'API album route loaded' });
        });

    }


    
    async dbConnection() {
        try {
            await bdmysql.authenticate();
            console.log('Connection OK a MySQL.');
            
            // Sincronizar modelos con la base de datos
            await bdmysql.sync({ alter: true });
            console.log('Tablas sincronizadas correctamente.');
        } catch (error) {
            console.error('No se pudo Conectar a la BD MySQL', error);
        }
    }
    
    //async conectarBDMongo(){
        //await dbConnectionMongo();
    //}

    
    routes() {


        /*
        this.app.get('/api', (req, res) => {
            //res.send('Hello World')
            res.json({ok:true,
                msg:'get API'
               })

        });

        this.app.post('/api', (req, res) => {
            //res.send('Hello World')
            res.status(201).json({ok:true,
                msg:'post API'
               })

        });

        this.app.put('/api', (req, res) => {
            //res.send('Hello World')
            res.json({ok:true,
                msg:'put API'
               })

        });

        this.app.delete('/api', (req, res) => {
            //res.send('Hello World')
            res.json({ok:true,
                msg:'delete API'
               })

        });

        this.app.patch('/api', (req, res) => {
            //res.send('Hello World')
            res.json({
                ok:true,
                msg:'patch API',
                status:'Status OK...'
               })

        });
        */
                   
        this.app.use(this.pathsMySql.auth, require('../routes/auth.route'));
        this.app.use(this.pathsMySql.heroes, require('../routes/heroes.route'));
        this.app.use(this.pathsMySql.qrLecturas,require('../routes/qrLectura.route'));
        this.app.use(this.pathsMySql.album, require('../routes/album.route'));
        this.app.use(this.pathsMySql.intercambios, require('../routes/intercambios.route'));
        //this.app.use(this.pathsMongo.usuarios, require('../routes/mongoUsuario.route'));

        //Activo la ruta del login
        //this.app.use(this.pathsMongo.auth, require('../routes/auth.route'));
        
        // Ruta de diagnóstico temporal para comprobar despliegue
        this.app.get('/api/album/debug', (req, res) => {
            res.json({ ok: true, msg: 'album route active', url: req.originalUrl, host: req.hostname });
        });
    }
    


    
    middlewares() {
        //CORS
        //Evitar errores por Cors Domain Access
        //Usado para evitar errores.
        this.app.use(cors());

        //Lectura y Parseo del body
        //JSON        
        //JSON (JavaScript Object Notation)
        //es un formato ligero de intercambio de datos.
        //JSON es de fácil lectura y escritura para los usuarios.
        //JSON es fácil de analizar y generar por parte de las máquinas.
        //JSON se basa en un subconjunto del lenguaje de programación JavaScript,
        //Estándar ECMA-262 3a Edición - Diciembre de 1999.
        this.app.use(express.json());


        //Directorio publico
        this.app.use(express.static('public'));


    }
    


    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en puerto', this.port);
            console.log(`\n✓ API disponible en: http://localhost:${this.port}`);
            console.log(`✓ Rutas de autenticación: http://localhost:${this.port}/api/auth/login\n`);
        });
    }


}


module.exports = Server;
