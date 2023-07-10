const { Category, Recipe } = require('../models')

const homeController = {

    homePage: async (req, res) => {
        try {
            const recipes = await Recipe.findAll();
            const categories = await Category.findAll();

            res.render('home', {
                categories,
                recipes
            });
        } catch (err) {
            console.log(err);
            res.status(500).send('Server Error')
        }
    },
}

module.exports = homeController;