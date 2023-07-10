const { Model, DataTypes } = require('sequelize');
const sequelize = require('../db');

class Category extends Model {}

Category.init({
    name: DataTypes.TEXT,
    image: DataTypes.TEXT,
}, {
    sequelize,
    tableName: "categories"
});

module.exports = Category;