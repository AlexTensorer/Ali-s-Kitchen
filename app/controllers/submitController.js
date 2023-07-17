const { Recipe } = require("../models");

const submitController = {
  submitPage: (req, res) => {
    res.render("submit");
  },

  submitRecipe: async (req, res) => {
    try {
      const user_id = req.session.userId;
      const { title, image, body, link, website, category_id } = req.body;

      let newRecipe = Recipe.build({
        title,
        image,
        body,
        link,
        website,
        category_id,
        user_id,
      });

      await newRecipe.save();
      req.flash("success", "Thank you for the recipe !");
      res.redirect(`/category/${req.body.category_id}`);
    } catch (error) {
      console.trace(error);
      res.status(500).send(error);
    }
  },
};

module.exports = submitController;
