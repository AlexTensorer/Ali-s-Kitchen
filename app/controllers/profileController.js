const { Recipe, User } = require("../models");

const profileController = {
  profile: async (req, res) => {
    try {
      const userId = req.session.userId;

      const recipes = await Recipe.findAll({
        where: {
          user_id: userId,
        },
        include: {model : User, as: 'user'},
      });

      res.render("profile", {
        recipes,
      });
    } catch (err) {
      console.log(err);
      res.status(500).render("500");
    }
  },

  profileRecipes: async (req, res) => {
    try {
      const userId = req.session.userId;

      const recipes = await Recipe.findAll({
        where: {
          user_id: userId,
        },
      });

      res.render("recipesByCategory", {
        recipes,
        category,
      });
    } catch (err) {
      console.log(err);
      res.status(500).render("500");
    }
  },
};

module.exports = profileController;
