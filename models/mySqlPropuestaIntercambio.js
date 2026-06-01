const { DataTypes } = require('sequelize');
const { bdmysql } = require('../database/MySqlConnection');

const PropuestaIntercambio = bdmysql.define('propuestas_intercambio_panini', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    usuario_a_id: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    usuario_b_id: {
        type: DataTypes.BIGINT,
        allowNull: false,
    },
    laminas_a: {
        type: DataTypes.JSON,
        allowNull: false,
        defaultValue: [],
    },
    laminas_b: {
        type: DataTypes.JSON,
        allowNull: false,
        defaultValue: [],
    },
    estado: {
        type: DataTypes.STRING(30),
        allowNull: false,
        defaultValue: 'pendiente',
    },
    tipo_logistica: {
        type: DataTypes.STRING(20),
        allowNull: true,
    },
    detalle_logistica: {
        type: DataTypes.TEXT,
        allowNull: true,
    },
    confirmado_a: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
    },
    confirmado_b: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
    },
    creada_en: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW,
    },
}, {
    freezeTableName: true,
    timestamps: false,
});

module.exports = PropuestaIntercambio;
