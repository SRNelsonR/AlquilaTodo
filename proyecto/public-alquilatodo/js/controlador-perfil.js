$(document).ready(function(){
    obtenerSession();
});

function cargarInformacion(codigo_usuario){
    var datos = `codigo_usuario=${codigo_usuario}`;
    $.ajax({
        url:"/informacion-usuario",
        method:"GET",
        data:datos,
        dataType:"json",
        success:function(res){

            $("#nombre-usuario").html(res[0].nombre);
            $("#apellido-usuario").html(res[0].apellido);
            $("#correo").html(res[0].correo);
            $("#telefono").html(res[0].telefono);
            $("#direccion").html(res[0].direccion);
            $("#fecha-nacimiento").html(corregirFecha(res[0].fecha_nacimiento));
            $("#fecha-creacion").html(corregirFecha(res[0].fecha_creacion));
            $("#genero").html(res[0].genero);

            $("#nombre-modal").val(res[0].nombre);
            $("#apellido-modal").val(res[0].apellido);
            $("#telefono-modal").val(res[0].telefono);
            $("#direccion-modal").val(res[0].direccion);
        },
        error:function(error){
            console.error(error);
        }
    });
}

function corregirFecha(fecha){
    var correccion = fecha.split("T");
    return correccion[0];
}

function obtenerSession(){
    $.ajax({
        url:"/obtener-session",
        method:"GET",
        dataType:"json",
        success:function(res){
            $("#codigo-usuario").val(res.codigo_usuario);
            cargarInformacion(res.codigo_usuario);
        },
        error:function(error){
            console.error(error);
        }
    });
}

$("#btn-modificar-datos").click(function(){
    var datos = `nombre=${$("#nombre-modal").val()}&apellido=${$("#apellido-modal").val()}&telefono=${$("#telefono-modal").val()}&direccion=${$("#direccion-modal").val()}&codigo_usuario=${$("#codigo-usuario").val()}`;
    if(
        $("#nombre-modal").val() == "" || 
        $("#apellido-modal").val() == "" ||
        $("#telefono-modal").val() == "" ||
        $("#direccion-modal").val() == ""
    ){
        alert("Los campos deben estar llenos");
        $("#error").fadeIn().delay(3000).fadeOut();
    }else{    
            $.ajax({
                url:"/actualizar-usuario",
                method:"POST",
                data:datos,
                dataType:"json",
                success:function(res){
                    actualizarSesion($("#correo-modal").val());
                    window.setTimeout(function(){
                        window.location.href = "/perfil.html";
                    }, 1000);
                },
                error:function(error){
                    console.error(error);
                }
            });
    }
});

function actualizarSesion(correo){
    var datos = `correo=${correo}`;
    $.ajax({
        url:"/actualizar-variables-session",
        method:"POST",
        data:datos,
        dataType:"json",
        success:function(res){
            
        },
        error:function(error){
            console.error(error);
        }
    });
}

/* Cerrar Sesión */
$("#cerrar-sesion").click(function(){
    $.ajax({
        url:"/cerrar-session",
        method:"GET",
        success:function(res){
            console.log(res);
            window.location.href = "/index.html";
        },
        error:function(error){
            console.error(error);
        }
    });
});