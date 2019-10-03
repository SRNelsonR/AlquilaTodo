var express = require("express");
var session = require("express-session");
var mysql = require("mysql");
var bodyParser = require("body-parser");
const port = 8001;

var app = express();

var credenciales = {
    host:"localhost",
    user:"root",
    password:"",
    port:3306,
    database:"db_alquilatodo"
};

app.use(express.static("public"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(session({secret:"ASDFE$%#%",resave:true, saveUninitialized:true}));

//Verificar si existe una variable de sesion para poner publica la carpeta public-alquilatodo
var publicAlquilatodo = express.static("public-alquilatodo");
app.use(
    function(req,res,next){
        if (req.session.correo){
            //Significa que el usuario si esta logueado
            publicAlquilatodo(req,res,next);
        }
        else
            return next();
    }
);


// -----------------------Gestion de Usuarios---------------------------
// Creacion de Usuario
app.post("/crear-usuario", function(req, res){
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        "INSERT INTO tbl_usuarios (genero, nombre, apellido, correo, contrasena, telefono, direccion, estado_usuario, fecha_nacimiento, fecha_creacion, fecha_modificacion) VALUES (?, ?, ?, ?, sha1(?), ?, ?, 'Activo', ?, ?, ?)",
        [
            req.body.genero,
            req.body.nombre,
            req.body.apellido,
            req.body.correo,
            req.body.contrasena,
            req.body.telefono,
            req.body.direccion,
            req.body.fecha_nacimiento,
            req.body.fecha_creacion,
            req.body.fecha_modificacion
        ],
        function(error, data, fields){
            if (error){
                res.send(error);
                res.end();
            }else{
                res.send(data);
                res.end();
            }
        }
    );
    conexion.end();
});

// Actualizar Usuario
app.post("/actualizar-usuario", function(req, res){
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        "UPDATE tbl_usuarios SET codigo_plan = ?, nombre = ?, apellido = ?, correo = ?, nickname = ?, contrasena = sha1(?) WHERE id_usuario = ?",
        [
            req.body.codigo_plan,
            req.body.nombre,
            req.body.apellido,
            req.body.correo,
            req.body.nickname,
            req.body.contrasena,
            req.body.codigo_usuario
        ],
        function(error, data, fields){
            res.send(data);
        }
    );
    conexion.end();
});

// Actualizar las variables de sesion al actualizar un usuario
app.post("/actualizar-variables-session", function(req, res){
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        "select id_usuario, codigo_genero, codigo_plan, nombre, apellido, correo, nickname, contrasena, fecha_creacion from tbl_usuarios where correo = ? and contrasena = sha1(?)",
        [
            req.body.correo,
            req.body.contrasena
        ],
        function(error, data, fields){
            if (error){
                res.send(error);
                res.end();
            }else{
                if (data.length==1){
                    req.session.codigoUsuario = data[0].id_usuario;
                    req.session.correoUsuario = data[0].correo;
                    req.session.codigoPlan = data[0].codigo_plan;
                    req.session.nombre = data[0].nombre;
                    req.session.apellido = data[0].apellido;
                    req.session.nickname = data[0].nickname;
                }
                res.send(data);
                res.end();
            }
        }    
    );
    conexion.end();
});

// Variables de sesion (Estaba como POST lo cambia a GET)
app.get("/login", function(req, res){
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        "SELECT codigo_usuario, nombre, apellido, correo, telefono, direccion, estado_usuario, fecha_nacimiento FROM tbl_usuarios WHERE correo = ? and contrasena = sha1(?) and estado_usuario = 'Activo'",
        [
            req.body.correo,
            req.body.contrasena
        ],
        function(error, data, fields){
            if (error){
                res.send(error);
                res.end();
            }else{
                if (data.length==1){
                    req.session.codigo_usuario = data[0].codigo_usuario;
                    req.session.nombre = data[0].nombre;
                    req.session.apellido = data[0].apellido;
                    req.session.correo = data[0].correo;
                    req.session.telefono = data[0].telefono;
                    req.session.direccion = data[0].direccion;
                    req.session.estado_usuario = data[0].estado_usuario;
                    req.session.fecha_nacimiento = data[0].fecha_nacimiento;
                }
                res.send(data);
                res.end();
            }
        }    
    );
    conexion.end();
});

// Obtener Sesion
app.get("/obtener-session",function(req,res){
    var datosSesion = {
        codigo_usuario:req.session.codigo_usuario,
        nombre:req.session.nombre,
        apellido:req.session.apellido,
        correo:req.session.correo,
        telefono:req.session.telefono,
        direccion:req.session.direccion,
        estado_usuario:req.session.estado_usuario,
        fecha_nacimiento:req.session.fecha_nacimiento
    }
    res.send(datosSesion);
    res.end();
});

// Cerrar Sesion
app.get("/cerrar-session",function(req,res){
    req.session.destroy();
    res.send("Sesion eliminada");
    res.end();
});




app.listen(port, function(){
    console.log(`Servidor levantado con éxito. En la direccion http://localhost:${port}/`);
});