var express = require("express");
var session = require("express-session");
var mysql = require("mysql");
var bodyParser = require("body-parser");

var app = express();

app.use(express.static("public"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(session({secret:"ASDFE$%#%",resave:true, saveUninitialized:true}));

var publicDepages = express.static("puclic-alquilatodo");
/* app.use(
    function(req,res,next){
        if (req.session.correoUsuario){
            //Significa que el usuario si esta logueado
            publicDepages(req,res,next);
        }
        else
            return next();
    }
); */


app.listen(8001, function(){
    console.log("Servidor levantado con éxito.");
});