<%-- 
    Document   : perfil
    Created on : Jul 17, 2015, 12:36:17 AM
    Author     : david
--%>
 
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="edu.pucmm.pw.servicios.PaisesFacade"%>
<%@page import="edu.pucmm.pw.servicios.TipoLugaresFacade"%>
<%@page import="edu.pucmm.pw.entidades.Paises"%>
<%@page import="edu.pucmm.pw.entidades.Paises"%>
<%@page import="edu.pucmm.pw.entidades.TipoLugares"%>
<%@page import="java.util.List"%>
<%@page import="edu.pucmm.pw.servicios.UsuariosFacade"%>
<%@page import="edu.pucmm.pw.entidades.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%  javax.naming.Context context = new javax.naming.InitialContext();
        String jndiUrl = "java:comp/env/UsuariosFacade";
        UsuariosFacade usuariosFacade = (UsuariosFacade) context.lookup(jndiUrl);
        String jndiUrl3 = "java:comp/env/TipoLugaresFacade";
        TipoLugaresFacade tipoLugaresFacade = (TipoLugaresFacade) context.lookup(jndiUrl3);
        String jndiUrl4 = "java:comp/env/PaisesFacade";
        PaisesFacade paisesFacade = (PaisesFacade) context.lookup(jndiUrl4);
   
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/index/index.js"></script>
   <!--[if lt IE 9]>
   <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
   <![endif]-->
   <link href="css/styles.css" rel="stylesheet">
    </head>
      
    <body>
        <% 
            if(application.getAttribute("idUsuario")!=null){
                Usuarios usuarioActual = null;
                usuarioActual = usuariosFacade.find(application.getAttribute("idUsuario")); 
        %>
        
        <div class="wrapper">
        <div class="box">
        <div class="row row-offcanvas row-offcanvas-left">
          
            <!-- sidebar -->
            
            <!-- /sidebar -->
          
            <!-- main right col -->
            <div class="column col-sm-12 col-xs-11" id="main">
                
                <!-- top nav -->
                  <div class="navbar navbar-blue navbar-static-top ">  
                    <div class="navbar-header col-md-offset-1">
                    <a href="/parcial2_grupo6/home.jsp" class="navbar-brand logo">f</a>
                    </div>
                    <nav class="collapse navbar-collapse" role="navigation">
                        <form class="navbar-form navbar-left" >
                            <div class="input-group input-group-sm" style="max-width:360px;">
                                <input type="text" class="form-control" placeholder="Buscar en Feibu" name="srch-term" id="srch-term" size="800px">
                              <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                              </div>
                            </div>
                        </form>
                        <ul class="nav navbar-nav">
                          <li>
                            <a href="/parcial2_grupo6/home.jsp"><i class="glyphicon glyphicon-home"></i></a>
                          </li>
                          <li>
                            <a href="#postModal" role="button" data-toggle="modal"><i class="glyphicon glyphicon-globe"></i></a>
                          </li>
                          <li>
                            <a href="#"><i class="glyphicon glyphicon-plus"></i></a>
                           </li>
                           <li>
                                <a href="https://www.facebook.com/djse1993" title="Perfil">
                                <img src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/c0.0.50.50/p50x50/1384338_10152731259415973_1038309681161336048_n.jpg?oh=30c601486023e844b1bf279bdea2ff58&oe=5614B6EC&__gda__=1448157405_699c164efb217456d05f7b3834006aab"
                                     alt id="profile_pic_header_736435972">
                                <span class="_2dpb">
                                  <%=usuarioActual.getIdpersona().getNombres()%>
                                </span>
                               </a>
                           </li>
                        </ul>
                                     <ul class="nav navbar-nav navbar-right">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i></a>
                            <ul class="dropdown-menu">
                               <li><a href="#">Ver perfil</a></li>
                              <li><a href="editarPerfil.jsp" >Editar perfil</a></li>                              
                              <li><a href="">Imagenes</a></li>
                              <li><a href="">Sugerencias de amigos</a></li>
                              <li><a href="">Configuraciones</a></li>
                            <%if (usuarioActual.getIdpersona().getIdrol().getIdrol()==1){%>
                              <li><a href="Usuarios.jsp">Ver todos los usuarios</a></li>    
                             <% }%>
                              <li><a href="cerrarSesion.jsp">Cerrar sesión</a></li>
                            </ul>
                          </li>
                        </ul>                    
                    </nav>
                </div>
                <!-- /top nav -->
              
                <div class="padding">
                    <div class="full col-sm-12 col-lg-offset-3">
 
                      
                        <!-- content -->                      
                          <div class="row">
                          
                       </div>
                          
                          
                          <!--Footer-->                     
 
                      
                        <div class="row" id="footer">    
                            <div class="col-sm-7">
                                <h2 align="center">Editar perfil</h2>
                                <br>
                                <form class="form-horizontal" action="/parcial2_grupo6/CRUDServlet">
                                    <div class="form-group">
                                      <label for="lugar" class="col-sm-2 control-label">Lugar visitado</label>
                                      <div class="col-sm-5">
                                          <input type="text" class="form-control" id="lugar" name="lugar" placeholder="Lugar visitado" required="required">
                                      </div>
                                    </div>
                                    <div class="form-group">
                                      <label for="descripcion" class="col-sm-2 control-label">Breve descripción</label>
                                      <div class="col-sm-8">
                                          <textarea class="form-control" type="text" id="descripcion" name="descripcion" placeholder="Breve descripción" required="required"></textarea>
                                      </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="tipoLugar" class="col-sm-2 control-label">Tipo de lugar</label>
                                        <div class="col-sm-5">
                                        <select class="form-control"  id="tipoLugar" name="tipoLugar" required="required"> 
                                            <% List<TipoLugares> listaTipoLugares = tipoLugaresFacade.findAll();%>
                                            <option name="tipoLugar" >Seleccione el tipo de lugar</option>  
                                            <%for(TipoLugares tipolugar: listaTipoLugares){%>
                                            <option name="tipoLugar" value=<%=tipolugar.getIdtipolugar()%>><%=tipolugar.getNombre()%></option>
                                            <%}%>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="paisLugar" class="col-sm-2 control-label">País</label>
                                        <%List<Paises> listaPaises = paisesFacade.findAll();%>
                                        <div class="col-sm-5">
                                        <select class="form-control"  id="paisLugar" name="paisLugar" required="required"> 
                                           <option >Seleccionar país del lugar...</option>
                                            <%for (Paises pais: listaPaises){ %>
                                           <option name="pais"  value=<%=pais.getIdpais()%> > <%=pais.getNombre()%></option><%}%>
                                       </select>
                                        </div>
                                   </div>
                                   <div class="form-group">
                                        <label for="ciudadLugar" class="col-sm-2 control-label">Ciudad</label>
                                       <div class="col-sm-5">
                                        <select class="form-control" id="ciudadLugar" name="ciudadLugar" required="required">
                                           <option >Seleccionar ciudad del lugar...</option>
                                       </select>
                                       </div>
                                   </div>
                                    <div class="form-group">
                                        <label for="fechaInicio" class="col-sm-2 control-label">Fecha de inicio</label>
                                        <div class="col-sm-5">
                                            <select class="form-control" id="fechaInicio" name="fechaInicio" required="">
                                                <%int ano = Calendar.getInstance().get(Calendar.YEAR);;%>
                                                <% for(int i=1940;i<=ano;i++){%>
                                                <option><%=i%></option><%}%>
                                            </select>
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <label for="fechaFinal" class="col-sm-2 control-label">Fecha final</label>
                                         <div class="col-sm-5">
                                            <select class="form-control" id="fechaFinal" name="fechaFinal" required="">
                                                <option selected="Actualmente...">Actualmente...</option>
                                                <% for(int i=1940;i<=ano;i++){%>
                                                <option value=<%=i%>><%=i%></option><%}%>
                                            </select>                                         
                                        </div>
                                    </div>
                                    <div class="form-group">
                                      <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" id="guardarInformacion" name="guardarInformacion" class="btn btn-default">Guardar información</button>
                                      </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-6">
                                <p>
                                <a href="#" class="pull-right">©Copyright 2015</a>
                                </p>
                            </div>
                        </div>
                        
                      
                    </div><!-- /col-9 -->
                </div><!-- /padding -->
            </div>
            <!-- /main -->
          <div id="postModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <ul>A Cesar Vargas le gusta tu foto</ul>
                </div>
            </div>
          </div>
        </div>
    </div>
 </div>
                   
        <%    
            } else{ %> <h2> No hay sesión </h2> <%response.sendRedirect("index.jsp"); %> 
        <%}%>
        
 
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    <script>
        document.getElementById('boton').onclick = function() {
        document.getElementById('file').click();
        };
        $('input[type=file]').change(function (e) {
            $('#customfileupload').html($(this).val());
        });
    </script>
    </body>