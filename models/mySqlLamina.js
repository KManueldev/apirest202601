const { DataTypes } = require('sequelize');
const { bdmysql } = require('../database/MySqlConnection');

const LaminasPanini = bdmysql.define('laminas_panini_2026', {
    id: {
        type: DataTypes.STRING(10),
        allowNull: false,
        primaryKey: true,
    },
    nombre_sticker: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    fecha_nacimiento: {
        type: DataTypes.DATE,
    },
    estatura_cm: {
        type: DataTypes.INTEGER,
    },
    peso_kg: {
        type: DataTypes.INTEGER,
    },
    equipo_actual: {
        type: DataTypes.STRING(100),
    },
    es_especial: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
    },
    foto_url: {
        type: DataTypes.STRING(255),
    },
    iso3: {
        type: DataTypes.STRING(3),
    },
    posicion: {
        type: DataTypes.STRING(15),
    },
}, {
    freezeTableName: true,
    timestamps: false,
});

module.exports = LaminasPanini;
