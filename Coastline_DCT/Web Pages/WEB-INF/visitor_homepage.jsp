<%-- 
    Document   : index
    Created on : Apr 30, 2024, 9:59:24 PM
    Author     : cerrchus
--%>

//redirects to /Login /search /Register /ContactUs /faq /github(orDocumentation) /SupportUs(maybe?) 
//aside: usually for applications or services that are opensource the documentation is a link to the README.md in the repo


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coastline - DCT</title>
    </head>
    <body>
        <h1>Welcome to the Coastline: Deck Creation Tool :)</h1>
        <p><strong>${visitorCount}</strong> Hits!</p>
        <a href="register.html">register user</a>
    </body>
</html>
