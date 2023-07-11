const { Model, DataTypes } = require('sequelize');
const sequelize = require('../db');

class Recipe extends Model {}

Recipe.init({
    title: DataTypes.TEXT,
    image: DataTypes.TEXT,
    body: DataTypes.TEXT,
    link: DataTypes.TEXT,
    website: DataTypes.TEXT,
    user_id: DataTypes.INTEGER,
    category_id: DataTypes.INTEGER
}, {
    sequelize,
    tableName: "recipe"
});

module.exports = Recipe;