const emailValidator = require('email-validator');
const bcrypt = require('bcrypt');
const { User } = require('../models');
const validateEmail = require('../../middlewares/validateEmail');


const authController = {

    signup : (req, res) => {
        res.render('signup')
    },


    createUser : async (req, res) => {
        const {
            email,
            password,
            username,
            confirmation: passwordConfirm,
        } = req.body;

        if (
            !username ||
            !email ||
            !password ||
            !passwordConfirm
        ) {
            return res.render('signup', {
                error: 'Please fill out all fields',
            });
        }

        if (password !== passwordConfirm) {
            return res.render('signup', {
                error: 'Password confirmation does not match',
            });
        }

        // Validation d'email
        if (!emailValidator.validate(email)) {
            return res.render('signup', {
                error: "Please enter a valid email",
            });
        }

        try {
            const existsUser = await User.findOne({
                where: {email},
            });
            if(existsUser) {
                return res.redirect('signup', {
                    error: "Unexpected error, please try again"
                })
            }

            const saltRounds = 10;
            const salt = await bcrypt.genSalt(saltRounds)
            const encryptedPass = await bcrypt.hash(password, salt)

            await User.create({
                username,
                email,
                role: 'user',
                password: encryptedPass,
            });

            res.redirect('/login?registered=true')
        } catch (error) {
            res.status(500).send(error.message)
        }
    },

    login : (req, res) => {
        let registered = false;
        if (req.query.registered) {
            registered = req.query.registered;
        }
        res.render('login', { registered })
    },

    createSession : async (req, res) => {
        const { email, password } = req.body

        if (!emailValidator.validate(email)) {
            return res.render('login', {
                error: "Unexpected error"
            });
        }

        try {
            const existsUser = await User.findOne({
                where: { email },
                attributes: { exclude: ['created_at', 'updated_at']},
            });

            if (!existsUser) {
                return res.render('login', {
                    error: "Email or password incorrect",
                });
            }

            const ok = await bcrypt.compare(password, existsUser.password);

            if (!ok) {
                return res.render('login', {
                    error: "Email or password incorrect"
                });
            }

            req.session.userId = existsUser.id;

            res.redirect('/');
        } catch (error) {
            res.status(500).send(error.message);
        }
    },

    destroy : (req, res) => {
        req.session.user = null;
        res.locals.user = null;
        req.session.userId = null;
        req.session.destroy();

        res.redirect('/?logged=false');
    }

}

module.exports = authController;
