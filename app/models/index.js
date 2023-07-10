const User = require('./users');
const Recipe = require('./recipes');
const Category = require('./categories');


Recipe.belongsToMany(Category, {
    as: 'categories',
    through: 'recipe_has_category',
    foreignKey: 'recipe_id',
    otherKey: 'category_id',
});

Category.belongsToMany(Recipe, {
    as: 'recipes',
    through: 'recipe_has_category',
    foreignKey: 'category_id',
    otherKey: 'recipe_id',
});

User.hasMany(Recipe, {
    as: 'recipes',
    foreignKey: 'user_id'    
});

Recipe.belongsTo(User, {
    as: 'users',
    foreignKey: 'user_id'
});

module.exports = { User, Recipe, Category }