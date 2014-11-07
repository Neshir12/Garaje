$(document).ready(function(){
    $('#form1').validate({
        rules:{
            idPersona:{
                required: true
            },
            Dni:{
                required: true
            },
            Nombre:{
                required: true
            },
            Apellidos:{
                required: true
            }
        },
        messages:{
            idPersona: {
                required: "Debe introducir el idPersona de la persona"
            },
            Dni: {
                required: "Debe introducir el Dni de la persona"
            },
            Nombre: {
                required: "Debe introducir el nombre de la persona"
            },
            Apellidos:{
                required: "Debe introducir el Apellido de la persona"
            }
        }
    });
});


