function isLoggedIn(req, res, next) {
    // console.log(req.url); enregistré ce param pour rediriger l'utilisateur verts l'url qu'il souhaite au départ

    if (!req.session.user) {
        return res.redirect('/login?registered=false');
    }

    next();
}

function isAdmin(req, res, next) {
    // if (!req.session.user) {
    //     return res.redirect('/login');
    // }

    if (req.session.user.role !== 'admin') {
        return res.redirect('/');
    }

    next();
}

//  quizoclock

module.exports = { isLoggedIn, isAdmin };