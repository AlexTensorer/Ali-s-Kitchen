const { User } = require('../app/models');
const session = require('express-session');

const inOneHour = 60 * 60 * 1000;

const initSession = session({
    secret: process.env.SECRET,
    resave: true,
    saveUninitialized: true,
    cookie: { secure: false, expires: inOneHour }, // cookies expire dans 1 heure
});

const flashMiddleware = (req, res, next) => {
    res.locals.successFlash = req.flash("success");
    res.locals.errorFlash = req.flash("error");
    next();
};


async function addUsersTolocals(req, res, next) {
    const userId = req.session.userId;

    if (userId) {
        const user = await User.findByPk(userId, {
            attributes: { exclude: 'password' },
        });

        req.session.user = user;
        res.locals.user = user;
    } else {
        res.locals.user = null; // Set user to null if not found in the session
    }

    next();
};
  



module.exports = { addUsersTolocals, initSession, flashMiddleware };