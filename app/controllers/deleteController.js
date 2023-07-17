const { Recipe } = require("../models");

const deleteController = {
  deleteRecipe: async (req, res) => {
    try {
      const recipeId = req.params.recipe_id;
      const recipe = await Recipe.findByPk(recipeId);
      const categoryId = recipe.category_id;
      
      await recipe.destroy();
      req.flash("success", "Recipe deleted");
      res.redirect(`/category/${categoryId}`);
    } catch (err) {
      console.log(err);
      res.status(500).render("500");
    }
  },
};

module.exports = deleteController;
