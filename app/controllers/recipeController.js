const { Category, Recipe, User } = require("../models");
const { Op } = require('sequelize')
const Fuse = require('fuse.js');

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


searchRecipes: async(req, res) => {
  try {
    const keyword = req.query.keyword;

    const recipes = await Recipe.findAll({
      include: { model: User, as: 'user' },
    });

    const categories = await Category.findAll();

    const options = {
      includeScore: true,
      keys: ['title', 'body'],
      threshold: 0.5
    };

    const fuse = new Fuse([...recipes, ...categories], options);

    const searchResults = fuse.search(keyword);

    const matchedRecipes = searchResults
    .filter((result) => result.item instanceof Recipe)
    .map((result) => result.item);

    res.render('search-results', {
      recipes: matchedRecipes,
      keyword,
    });
  } catch (err) {
    console.log(err);
    res.status(500).render('500')
  }
}
};

module.exports = recipeController;
