const { Category, Recipe, User } = require("../models");

const recipeController = {
  showRecipesInCategory: async (req, res) => {
    try {
      const categoryId = req.params.category_id;

      const recipes = await Recipe.findAll({
        where: {
          category_id: categoryId,
        },
        include: {model : User, as: 'user'},

      });

      const category = await Category.findByPk(categoryId)

      res.render("recipesByCategory", {
        recipes,
        category,
      });

      console.log(author);

    } catch (err) {
      console.log(err);
      res.status(500).render("500");
    }
  },

  allRecipes: async (req, res) => {
    try {
      const recipes = await Recipe.findAll({
        include : {model : Category, as: 'category'},
        include : {model : User, as: 'user'}
      });

      res.render("allRecipes", {
        recipes
      });
    } catch (err) {
      console.log(err);
      res.status(500).render("500");
    }
  },
};

module.exports = recipeController;
