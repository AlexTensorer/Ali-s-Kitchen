const { Router } = require('express');
const authController = require('./controllers/authController');
const homeController = require('./controllers/homeController');
const profileController = require('./controllers/profileController');
const recipeController = require('./controllers/recipeController');
const submitController = require('./controllers/submitController');


const router = Router();

const { isLoggedIn } = require('../middlewares/isLoggedIn.js');
const { initSession } = require('../middlewares/initSession.js');


// Homepage

router.get('/', homeController.homePage);

// Recipes

router.get('/recipes', recipeController.allRecipes)
router.get('/category/:category_id', recipeController.showRecipesInCategory)

// Auth

router.get('/signup', authController.signup)
router.post('/signup', authController.createUser)

router.get('/login', authController.login)
router.post('/login', authController.createSession)

router.get('/profile', profileController.profile)
router.get('/logout', authController.destroy)

// Submit

router.get('/submit', isLoggedIn, submitController.submitPage)
router.post('/submit', initSession, submitController.submitRecipe)




module.exports = router