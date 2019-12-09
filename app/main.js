const express = require('express');
const handlebarsFactory = require('express-handlebars');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const config = require('./config');
const app = express();

app.use('/res', express.static('assets'));

const handlebars = handlebarsFactory.create({
    defaultLayout: 'wrapper',
    extname: '.hbs',
    helpers: {
        ifeq: function(a, b, options) {
            if (a === b) {
                return options.fn(this);
            }
            return options.inverse(this);
        }
    }
});

app.engine('hbs', handlebars.engine);
app.set('view engine', 'hbs');

app.use((req, res, next) => {
    let conn = mysql.createConnection({
        host: config.host,
        user: config.user,
        password: config.password,
        database: config.dbname
    });
    conn.connect((err) => {
        if (err) return next(err);
        req.db = conn;
        next();
    });
});

app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
	res.render('home', {title: 'Home Page'});
});

// Start our server
app.listen(21213, () => {
    console.log('App started at http://flipX.engr.oregonstate.edu:21213');
});
