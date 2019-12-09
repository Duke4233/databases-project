const express = require('express');
const handlebarsFactory = require('express-handlebars');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const config = require('./config');
const router = express.Router();

const app = express();
app.use('/res', express.static('assets'));

const handlebars = handlebarsFactory.create({
    defaultLayout: 'main',
    extname: '.template',
    helpers: {
        ifeq: function(a, b, options) {
            if (a === b) {
                return options.fn(this);
            }
            return options.inverse(this);
        }
    }
});

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');

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


// Application routers
app.get('/', function (req, res) {
  res.send('GET request to the homepage')
})

app.use(bodyParser.urlencoded({ extended: true }));

app.listen(23411, () => {
	console.log("App available on https://flipX.access.engr.oregonstate.edu:23411");
});
