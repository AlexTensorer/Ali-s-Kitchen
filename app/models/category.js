const { Model, DataTypes } = require('sequelize');
const sequelize = require('../db');

class Category extends Model {}

Category.init({
    name: DataTypes.TEXT,
    image: DataTypes.TEXT,
}, {
    sequelize,
    tableName: "category"
});

module.exports = Category;