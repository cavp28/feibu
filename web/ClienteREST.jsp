<%-- 
    Document   : ClienteREST
    Created on : Jul 26, 2015, 9:46:35 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form id ="formPost" name="formPost" method="POST" action="/parcial2_grupo6/webresources/post/">
            Email: <input type="text" name="emailUsuario" id="emailUsuario" required="required">
            <br>
            Email de amigo: <input type="text" name ="emailUsuarioPerfil" id="emailUsuarioPerfil">
            <br>
            Contraseña: <input type="password" name="contrasena" id="contrasena" required="required">
            <br>
            Post: <input type="text" name="post" id="post" required="required">
            <br>
            Tipo de post: <input type="text" name="tipoPost" id="tipoPost" required="required">
            <br>
            <input type="submit" name="butonPublicar" id="butonPublicar" value="Publicar Post">
            <br>
        </form>
    </body>
</html>