const { DataTypes } = require('sequelize');
const { bdmysql } = require('../database/MySqlConnection');
const Usuario = require('./mySqlUsuario');
const LaminasPanini = require('./mySqlLamina');

const Coleccion = bdmysql.define('colecciones_panini', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    usuario_id: {
        type: DataTypes.BIGINT,
        allowNull: false,
        references: {
            model: Usuario,
            key: 'id',
        },
    },
    lamina_id: {
        type: DataTypes.STRING(10),
        allowNull: false,
        references: {
            model: LaminasPanini,
            key: 'id',
        },
    },
    estado: {
        type: DataTypes.STRING(20),
        allowNull: false,
        defaultValue: 'poseida',
    },
    creada_en: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW,
    },
}, {
    freezeTableName: true,
    timestamps: false,
    indexes: [
        {
            unique: true,
            fields: ['usuario_id', 'lamina_id'],
        },
    ],
});

module.exports = Coleccion;
