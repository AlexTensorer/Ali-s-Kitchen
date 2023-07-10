const { Model, DataTypes } = require('sequelize');
const sequelize = require('../db');

class User extends Model {}

User.init({
    username: DataTypes.TEXT,
    email: DataTypes.TEXT,
    password: DataTypes.TEXT,
    role: DataTypes.TEXT,
    username: DataTypes.TEXT,
}, {
    sequelize,
    tableName: "users"
});

module.exports = User;