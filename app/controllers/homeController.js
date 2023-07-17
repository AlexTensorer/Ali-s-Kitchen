const { Category } = require('../models')

const homeController = {

    homePage: async (req, res) => {
        try {
            const category = await Category.findAll({
            });

            res.render('home', {
                category                
            });
        } catch (err) {
            console.log(err);
            res.status(500).send('Server Error')
        }
    },
}

module.exports = homeController;