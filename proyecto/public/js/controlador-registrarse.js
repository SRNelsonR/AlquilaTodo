$(document).ready(function(){
    
});


//Función para crear nuevo usuario verificando que los campos esten llenos
$("#btn-crear").click(function(){
    var date = new Date();
    var fecha = date.getFullYear() + "-"   + (date.getMonth()+1) + "-" + date.getDate() ;
    var datos = "nombre=" + $("#txt-nombre").val() + "&apellido=" + $("#txt-apellido").val() + "&correo=" + $("#txt-correo").val() + "&contrasena=" + $("#txt-password").val() + "&telefono=" + $("#txt-telefono").val() + "&direccion=" + $("#txta-direccion").val() + "&fecha_nacimiento=" + $("#txt-fecha-nacimiento").val() + "&genero=" + $("#slc-genero").val() + "&fecha_creacion=" + fecha + "&fecha_modificacion=" + fecha;
    if( 
        $("#txt-nombre").val() == "" || 
        $("#txt-apellido").val() == "" ||
        $("#txt-correo").val() == "" ||
        $("#txt-password").val() == "" ||
        $("#txt-telefono").val() == "" ||
        $("#txta-direccion").val() == "" ||
        $("#txt-fecha-nacimiento").val() == "" ||
        $("#slc-genero").val() == 0
    ){
        //alert("valores vacios");
        $("#error").fadeIn().delay(3000).fadeOut();
    }else{
        //alert("Llenos");        
        $.ajax({
            url:"/crear-usuario",
            method:"POST",
            data:datos,
            dataType:"json",
            success:function(res){
                console.log(res);
                $("#creado").fadeIn().delay(3000).fadeOut();
                window.setTimeout(function(){
                    window.location.href = "/login.html";
                }, 5000);
                $("#btn-crear").prop('disabled', true)
            },
            error:function(error){
                console.error(error);
            }
        });
    }
});