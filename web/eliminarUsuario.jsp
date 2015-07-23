<%-- 
    Document   : eliminarUsuario
    Created on : Jul 23, 2015, 1:03:40 AM
    Author     : david
--%>

<%@page import="edu.pucmm.pw.entidades.Personas"%>
<%@page import="edu.pucmm.pw.servicios.PersonasFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <%javax.naming.Context context = new javax.naming.InitialContext();
    String jndiUrl = "java:comp/env/PersonasFacade";
    PersonasFacade personasFacade = (PersonasFacade) context.lookup(jndiUrl);%>
    
    <body>
        <%if(request.getParameter("idPersona")!=null){%>
        <%Personas p = personasFacade.find(Integer.parseInt(request.getParameter("idPersona")));
        personasFacade.remove(p);
        response.sendRedirect("Usuarios.jsp");}%>
        
    </body>
</html>
