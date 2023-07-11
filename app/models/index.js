const User = require('./user');
const Recipe = require('./recipe');
const Category = require('./category');



Category.hasMany(Recipe, {
    as: 'recipe',
    foreignKey: 'category_id',
});

User.hasMany(Recipe, {
    as: 'recipe',
    foreignKey: 'user_id'    
});

Recipe.belongsTo(User, {
    as: 'user',
    foreignKey: 'user_id'
});

Recipe.belongsTo(Category, {
    as: 'category',
    foreignKey: 'category_id'
});

module.exports = { User, Recipe, Category }