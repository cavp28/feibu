<%-- 
    Document   : cerrarSesion
    Created on : Jul 20, 2015, 11:43:17 AM
    Author     : david
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>