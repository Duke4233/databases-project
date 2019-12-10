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
	res.render('home', {title: 'Welcome to the Tutor Management System'});
});

app.get('/tutors', (req, res) => {
	res.render('tutors', {title: 'Tutors'});
});

app.get('/courses', (req, res, next) => {
    req.db.query(
    `
    SELECT * FROM Course
    `,
    (err, data) => {
        if (err) {
            return next(err);
	}
		
	res.render('courses', {
	    title: 'View courses',
	    courses: data
	});
    });
});

app.get('/account', (req, res) => {
	res.render('account', {title: 'Account'});
});

app.get('/login', (req, res) => {
	res.render('login', {title: 'Login'});
});

// Start our server
app.listen(21213, () => {
    console.log('App started at http://flipX.engr.oregonstate.edu:21213');
});
