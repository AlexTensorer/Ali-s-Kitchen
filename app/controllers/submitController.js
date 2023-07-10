const { Category, Recipe, User } = require("../models");

const submitController = {

  submitPage: (req, res) => {
    res.render("submit");
  },


  submitRecipe: async (req, res) => {
    try {
      const { title, image, body, link, website, category_id, user_id } = req.body;
      const category = req.body.category_id

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
        res.redirect(`/category/${category}`)
      } catch (error) {
        console.trace(error)
        res.status(500).send(error)
    }
  },
};

module.exports = submitController;
