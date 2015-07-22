<%-- 
    Document   : index
    Created on : Jul 10, 2015, 10:41:24 PM
    Author     : David Sanchez
--%>

<%@page import="edu.pucmm.pw.servicios.SexoFacade"%>
<%@page import="edu.pucmm.pw.entidades.Sexo"%>
<%@page import="java.lang.String"%>
<%@page import="edu.pucmm.pw.servicios.CiudadesFacade"%>
<%@page import="edu.pucmm.pw.entidades.Paises"%>
<%@page import="edu.pucmm.pw.servicios.PaisesFacade"%>

<%@page import="edu.pucmm.pw.entidades.Ciudades"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
        <title>Feibú</title>
	<meta name="generator" content="Bootply" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src ="js/index/index.js"></script>
        <script type="text/javascript" src="js/index/revisarClave.js"></script>
        <!--[if lt IE 9]>
            <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
        
    <%javax.naming.Context context = new javax.naming.InitialContext();
    String jndiUrl = "java:comp/env/PaisesFacade";
    PaisesFacade paisesFacade = (PaisesFacade) context.lookup(jndiUrl);%>
            
    <%String jndiUrl2 = "java:comp/env/CiudadesFacade";
    CiudadesFacade ciudadesFacade = (CiudadesFacade) context.lookup(jndiUrl2);%>
    
    <%String jndiUrl3 = "java:comp/env/SexoFacade";
    SexoFacade sexoFacade = (SexoFacade) context.lookup(jndiUrl3);%>
        
       
    </head>
    <body background="facebook-logo-wallpaper-background1.jpg">
        <br>
        <div class="col-md-offset-5">
            <form class="form-inline" id="formLogin" name="formLogin" method="POST" action="/parcial2_grupo6/CRUDServlet">
                <div class="form-group">
                    <label class="sr-only" for="Email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="Password">Contraseña</label>
                    <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Contraseña">
                </div>
                <button type="submit" name="opcion" value="Login" class="btn btn-primary" >
                   Iniciar sesión
                </button>
            </form>
        </div>
        <%if (request.getParameter("respuesta")!=null){
            /*
            -Respuesta 1 = usuario o contrasena invalida
            -Respuesta 2 = Registro... Email ya existente.
            -Respuesta 3 = Usuario Creado con exito
            */
            String respuesta = request.getParameter("respuesta");
            
         %>
                <br>
                
                <div class="col-md-4">
                    <% if(respuesta.equals("3")){%>
                    <div class="alert alert-success alert-dismissable">
                    <%} else {%>
                    <div class="alert alert-danger alert-dismissable">
                     <%}%>
                        <button type="button" clase="close" data-dismiss="alert" aria-hidden="true">
                            &times;
                        </button>
                        <% 
                          if(respuesta.equals("1")){  
                        %>
                        Email y/o contraseña incorrectos
                        <%} if (respuesta.equals("2")){
                        %>
                        Ya existe una cuenta vinculada con este email. Favor digitar otra.     
                        <%}%>
                        <% 
                          if(respuesta.equals("3")){  
                        %>
                        Usuario creado exitosamente
                        <%}%>
                        </div>
                     </div>
                </div>
        <%}%>
        <div class="col-md-offset-5">
            <br>
            <h2 style="color: white">¿Qué no tienes cuenta?</h2>  
            <button type ="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
                ¡Regístrate aquí!
            </button>
            <br>
        </div>
        
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog" style="background-color:#ffffff">
                <div class="modal-content">
                    <div class="modal-header" style="background-color:#ffffff">
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                       <h4 class="modal-title">Creación de su cuenta en Feibú</h4>
                    </div>
                </div>
                <div class="modal-body" style="background-color:#ffffff">
                   <form name="form1" method="POST" action="/parcial2_grupo6/CRUDServlet">
                        <div class="form-group">
                            <input class="form-control" type="text" name="nombres" placeholder="Nombres" required="required">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" name="apellidos" placeholder="Apellidos" required="required">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="email" name="email" placeholder="Email" required="required">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password" name="contrasena" placeholder="Contraseña" required="required">
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="password"  id="contrasenaRepetida" name="contrasenaRepetida" onkeyup="revisarClave(); return false" placeholder="Repita su contraseña" required="required">
                            <span id="confirmMessage" class="confirmMessage"></span>
                        </div> 
                        <div class="form-group">
                        <%List<Sexo> listaSexo = sexoFacade.findAll();%>
                             <select class="form-control"  id="sexo" name="sexo" required="required"> 
                                 <option value="" disabled selected>Selecciona tu genero</option>
                                 <%for (Sexo sexo: listaSexo){ %>
                                <option name="sexo"  value=<%=sexo.getIdsexo()%> > <%=sexo.getNombre()%></option><%}%>                              
                             </select> 
                        </div>
                        <div class="form-group">
                            <input class ="form-control" type="date" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento">
                            <style>.datepicker { z-index: 999999999;  }</style>
                        </div>
                        <div class="form-group">
                             <%List<Paises> listaPaises = paisesFacade.findAll();%>
                             <select class="form-control"  id="paisNacimiento" name="paisNacimiento" required="required"> 
                                 <option value="" disabled selected>Seleccionar país de nacimiento...</option>
                                 <%for (Paises pais: listaPaises){ %>
                                <option name="pais"  value=<%=pais.getIdpais()%> > <%=pais.getNombre()%></option><%}%>
                            </select> 
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="ciudadNacimiento" name="ciudadNacimiento" required="required">
                                <option value="" disabled selected>Seleccionar ciudad de nacimiento...</option>
                            </select>
                        </div>
                        <div class="form-group">
                             <%List<Paises> listaPaisesActuales = paisesFacade.findAll();%>
                             <select class="form-control"  id="paisActual" name="paisActual" required="required"> 
                                <option value="" disabled selected>Seleccionar país actual...</option>
                                 <%for (Paises pais: listaPaisesActuales){ %>
                                <option name="paisActualSelected"  value=<%=pais.getIdpais()%> > <%=pais.getNombre()%></option><%}%>
                            </select> 
                        </div>
                        <div class="form-group">
                            <select class="form-control" id="ciudadActual" name="ciudadActual" required="required">
                                <option value="" disabled selected>Seleccionar ciudad actual...</option>
                                <% %>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="background-color:#ffffff">
                    <button type="submit" name="opcion" value="Registrarse"class="btn btn-primary">Registrarse</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
                    
    </body>
</html>
