const { DataTypes } = require('sequelize');
const { bdmysql } = require('../database/MySqlConnection');

const Usuario = bdmysql.define('Usuario', {
    id: {
        type: DataTypes.BIGINT,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
    },
    nombre: {
        type: DataTypes.STRING(100),
        allowNull: true,
    },
    correo: {
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true,
    },
    password: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    img: {
        type: DataTypes.TEXT,
        allowNull: true,
    },
    rol: {
        type: DataTypes.STRING(30),
        allowNull: true,
        defaultValue: 'USER_ROLE',
    },
    pais: {
        type: DataTypes.STRING(80),
        allowNull: true,
    },
    estado: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: true,
    },
}, {
    tableName: 'usuarios',
    timestamps: false,
});

module.exports = Usuario;
