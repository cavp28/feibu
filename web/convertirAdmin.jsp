<%-- 
    Document   : convertirAdmin
    Created on : Jul 20, 2015, 12:40:02 AM
    Author     : david
--%>
 
<%@page import="edu.pucmm.pw.entidades.Roles"%>
<%@page import="edu.pucmm.pw.servicios.RolesFacade"%>
<%@page import="edu.pucmm.pw.entidades.Personas"%>
<%@page import="edu.pucmm.pw.servicios.PersonasFacade"%>
<%@page import="edu.pucmm.pw.servicios.UsuariosFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%javax.naming.Context context = new javax.naming.InitialContext();
    String jndiUrl = "java:comp/env/PersonasFacade";
    PersonasFacade personasFacade = (PersonasFacade) context.lookup(jndiUrl);%>
    <%String jndiUrl2 = "java:comp/env/RolesFacade";
    RolesFacade rolesFacade = (RolesFacade) context.lookup(jndiUrl2);%>
    
    <body>
        <%if(request.getParameter("idPersona")!=null){%>
        <%Personas p = personasFacade.find(Integer.parseInt(request.getParameter("idPersona")));
        Roles rol = new Roles(1,"Administrador");
        p.setIdrol(rol);
        personasFacade.edit(p);
        response.sendRedirect("Usuarios.jsp");}%>
        
    </body>
</html>