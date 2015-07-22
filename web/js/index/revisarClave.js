function revisarClave(){
    var clave1 = document.getElementById('contrasena');
    var clave2 = document.getElementById('contrasenaRepetida');

    var mensaje = document.getElementById('confirmMessage');

    var bienCSS = "#66cc66";
    var malCSS = "#ff6666";

    if(clave1.value === clave2.value){
        clave2.style.backgroundColor = bienCSS;
        mensaje.style.color = bienCSS;
        mensaje.innerHTML = "Contraseña coinciden!";
    }else{
        clave2.style.backgroundColor = malCSS;
        mensaje.style.color = malCSS;
        mensaje.innerHTML = "Contraseña no coinciden!";
    }
}  