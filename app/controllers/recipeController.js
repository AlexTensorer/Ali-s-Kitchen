const { Category, Recipe, User } = require('../models')

const recipeController = {

    showRecipesInCategory: async (req, res) => {
        try {
            const categoryId = req.params.id

            const recipes = await Recipe.findAll(
                { where: {
                    category_id: categoryId
                },

        }
        );
        const users = await User.findAll()

            const categories = await Category.findAll();

            res.render('recipes', {
                categories,
                recipes,
                users
            });
        } catch (err) {
            console.log(err);
            res.status(500).send('Server Error')
        }
    },

    allRecipes: async (req, res) => {
        try {
            const recipes = await Recipe.findAll();
            const categories = await Category.findAll();

            res.render('recipes', {
                categories,
                recipes
            });
        } catch (err) {
            console.log(err);
            res.status(500).send('Server Error')
        }
    },
}

module.exports = recipeController;