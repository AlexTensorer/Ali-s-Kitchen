const { Recipe, User } = require("../models");

const editController = {
  showEditRecipe: async (req, res) => {
    try {
      const recipeId = req.params.recipe_id;

      const recipe = await Recipe.findByPk(recipeId, {
        include: { model: User, as: "user" },
      });

      res.render("edit", {
        recipe,
      });
    } catch (err) {
      console.log(err);
      res.status(500).render("500");
    }
  },

  submitEditRecipe: async (req, res) => {
    try {
      const user_id = req.session.userId;
      const recipeId = req.params.recipe_id;
      const { title, image, body, link, website, category_id } = req.body;

      let recipe = await Recipe.findByPk(recipeId);
      if (!recipe) {
        res.status(404).render("500");
      } else {
        if (title) {
          recipe.title = title;
        }
        if (image) {
          recipe.image = image;
        }
        if (body) {
          recipe.body = body;
        }
        if (link) {
          recipe.link = link;
        }
        if (website) {
          recipe.website = website;
        }
        if (category_id) {
          recipe.category_id = category_id;
        }
        await recipe.save();
        req.flash("success", "Recipe successfully updated !");
        res.redirect(`/category/${req.body.category_id}`);
      }
    } catch (err) {
      console.trace(err);
      res.status(500).send(err)
    }
  },
};

module.exports = editController;
