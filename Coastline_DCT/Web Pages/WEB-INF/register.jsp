<%-- 
    Document   : register
    Created on : May 10, 2024, 1:19:22 AM
    Author     : cerrchus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">   
        <title>Iniciar Sesion / Registrarse</title>
        <link rel="stylesheet" href="./css/IniciarSesión_Registrarse.css">
    </head>
    <body>


        <h2>Registrarse</h2>
        <form action="/Register" method="post">
            fName:<input type="text" name="firstname" placeholder="Nombre" required>
            lName:<input type="text" name="lastname" placeholder="Apellido/s" required>
            Email:<input type="text" name="email" placeholder="Correo Electronico" required>
            Username:<input type="text" name="nombre_usuario" placeholder="Nombre de usuario" required>
            Password:<input type="password" name="contrasena" placeholder="Contraseña" required>

            <input type="submit" value="Registrarse">
        </form>
    </body>
</html>
a
