const emailValidator = require("email-validator");
const bcrypt = require("bcrypt");
const { User } = require("../models");
const validatePassword = require("../../middlewares/validatePassword");

const authController = {
  signup: (req, res) => {
    res.render("signup");
  },

  createUser: async (req, res) => {
    const {
      email,
      password,
      username,
      confirmation: passwordConfirm,
    } = req.body;
  
    let error = null;
  
    if (!username || !email || !password || !passwordConfirm) {
      error = "Please fill out all fields";
    } else if (!emailValidator.validate(email)) {
      error = "Please enter a valid email";
    } else if (password !== passwordConfirm) {
      error = "Password confirmation does not match";
    } else {
      const passwordValidationMsg = validatePassword(password);
      if (passwordValidationMsg) {
        error = passwordValidationMsg;
      }
    }
  
    if (error) {
      console.log("Error message:", error);
      return res.render("signup", { error, formData: req.body });
    }
  
    try {
      const existsUser = await User.findOne({ where: { email } });
      if (existsUser) {
        error = "Email already exists";
        console.log("Error message:", error);
        return res.render("signup", { error, formData: req.body });
      }
  
      const saltRounds = 10;
      const salt = await bcrypt.genSalt(saltRounds);
      const encryptedPass = await bcrypt.hash(password, salt);
  
      await User.create({
        username,
        email,
        role: "user",
        password: encryptedPass,
      });
  
      res.redirect("/login?registered=true");
    } catch (error) {
      console.log("Error message:", error.message);
      res.status(500).send(error.message);
    }
  },

  login: (req, res) => {
    let registered = false;
    if (req.query.registered) {
      registered = req.query.registered;
    }
    res.render("login", { registered });
  },

  createSession: async (req, res) => {
    const { email, password } = req.body;

    if (!emailValidator.validate(email)) {
      return res.render("login", {
        error: "Unexpected error",
      });
    }

    try {
      const existsUser = await User.findOne({
        where: { email },
        attributes: { exclude: ["created_at", "updated_at"] },
      });

      if (!existsUser) {
        return res.render("login", {
          error: "Email or password incorrect",
        });
      }

      const ok = await bcrypt.compare(password, existsUser.password);

      if (!ok) {
        return res.render("login", {
          error: "Email or password incorrect",
        });
      }

      req.session.userId = existsUser.id;

      res.redirect("/");
    } catch (error) {
      res.status(500).send(error.message);
    }
  },

  destroy: (req, res) => {
    req.session.user = null;
    res.locals.user = null;
    req.session.userId = null;
    req.session.destroy();

    res.redirect("/?logged=false");
  },
};

module.exports = authController;
