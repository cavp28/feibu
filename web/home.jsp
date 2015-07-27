<%-- 
    Document   : home
    Created on : Jul 10, 2015, 10:19:13 PM
    Author     : David Sanchez
--%>

<%@page import="edu.pucmm.pw.entidades.Tipopost"%>
<%@page import="edu.pucmm.pw.entidades.Imagenes"%>
<%@page import="edu.pucmm.pw.servicios.ImagenesFacade"%>
<%@page import="edu.pucmm.pw.servicios.TipopostFacade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.pucmm.pw.servicios.AmistadesFacade"%>
<%@page import="edu.pucmm.pw.entidades.Amistades"%>
<%@page import="edu.pucmm.pw.entidades.Likes"%>
<%@page import="edu.pucmm.pw.servicios.LikesFacade"%>
<%@page import="edu.pucmm.pw.servicios.PaisesFacade"%>
<%@page import="edu.pucmm.pw.entidades.Paises"%>
<%@page import="edu.pucmm.pw.entidades.TipoLugares"%>
<%@page import="edu.pucmm.pw.servicios.TipoLugaresFacade"%>
<%@page import="edu.pucmm.pw.entidades.Comentarios"%>
<%@page import="edu.pucmm.pw.servicios.ComentariosFacade"%>
<%@page import="java.util.Collections"%>
<%@page import="edu.pucmm.pw.entidades.Posts"%>
<%@page import="java.util.List"%>
<%@page import="edu.pucmm.pw.servicios.PostsFacade"%>
<%@page import="edu.pucmm.pw.servicios.UsuariosFacade"%>
<%@page import="edu.pucmm.pw.entidades.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        javax.naming.Context context = new javax.naming.InitialContext();
        String jndiUrl = "java:comp/env/UsuariosFacade";
        UsuariosFacade usuariosFacade = (UsuariosFacade) context.lookup(jndiUrl);
        
        String jndiUrl1 = "java:comp/env/PostsFacade";
        PostsFacade postsFacade = (PostsFacade) context.lookup(jndiUrl1);
        
        String jndiUrl2 = "java:comp/env/ComentariosFacade";
        ComentariosFacade comentariosFacade = (ComentariosFacade) context.lookup(jndiUrl2);
        
        String jndiUrl3 = "java:comp/env/TipoLugaresFacade";
        TipoLugaresFacade tipoLugaresFacade = (TipoLugaresFacade) context.lookup(jndiUrl3);
        
        String jndiUrl4 = "java:comp/env/PaisesFacade";
        PaisesFacade paisesFacade = (PaisesFacade) context.lookup(jndiUrl4);
     
        String jndiUrl5 = "java:comp/env/LikesFacade";
        LikesFacade likesFacade = (LikesFacade) context.lookup(jndiUrl5);
        
        String jndiUrl6 = "java:comp/env/AmistadesFacade";
        AmistadesFacade amistadesFacade = (AmistadesFacade) context.lookup(jndiUrl6);
        
        String jndiUrl7 = "java:comp/env/TipopostFacade";
        TipopostFacade tipoPostFacade = (TipopostFacade) context.lookup(jndiUrl7);
        
        String jndiUrl8 = "java:comp/env/ImagenesFacade";
        ImagenesFacade imagenesFacade = (ImagenesFacade) context.lookup(jndiUrl8);
        %>
    <head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Feibu- Home</title>
	<meta name="generator" content="Bootply" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.icon-large.min.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/timeline.css" rel="stylesheet" /> 
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <script src="js/jquery.js"></script>
        <script src="js/home/home.js"></script>
        <script src="js/dropzone/dropzone.js"></script>
        <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
	<!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<link href="css/styles.css" rel="stylesheet">
    </head>
    <body>
        
        <%
            if(request.getSession().getAttribute("idUsuario")!=null){
                Usuarios usuarioActual = null;
                
                usuarioActual = usuariosFacade.find(request.getSession().getAttribute("idUsuario"));               
               
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
                                <a href="Perfil.jsp" title="Perfil">
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
                              <li><a href="Perfil.jsp">Ver perfil</a></li>
                              <li><a href="editarPerfil.jsp">Editar perfil</a></li>                              
                              <li><a data-toggle="modal" data-target="#sugerirAmigosModal">Sugerencias de amigos</a></li>
                              <li><a href="">Configuraciones</a></li>
                              <%if (usuarioActual.getIdpersona().getIdrol().getIdrol()==1){%>
                              <li><a href="Usuarios.jsp" >Ver todos los usuarios</a></li>    
                             <% }%>
                              <li><a href="cerrarSesion.jsp">Cerrar sesión</a></li>
                            </ul>
                          </li>
                        </ul>
                    </nav>
                </div>
                <!-- /top nav -->
                
                <!-- Modal Recomendar Amigos-->
                <div id="sugerirAmigosModal" class="modal fade" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Sugerencias de Amigos</h4>
                      </div>
                      <div class="modal-body">
                          <div class="text-center pagination-centered list-group"> 
                              <%
                                List<Usuarios> listaUsuariosR = usuariosFacade.findAll();
                                List<Usuarios> listaUsuariosASuguerir;
                                List<Amistades> listaAmistades = usuarioActual.getAmistadesList();
                                List<Usuarios> listaDeAmigos = new ArrayList<Usuarios>();
                                for(Amistades a : listaAmistades){
                                    listaDeAmigos.add(usuariosFacade.find(a.getSoyamigode().getIdusuario()));
                                }
                                for(Usuarios u : listaUsuariosR){
                                   if(!listaDeAmigos.contains(u)){
                                        if((usuarioActual.getIdusuario()!=u.getIdusuario() && usuarioActual.getIdpersona().getLugaractual().getIdciudad()==u.getIdpersona().getLugaractual().getIdciudad()) || ( usuarioActual.getIdusuario()!=u.getIdusuario() &&
                                                                                            usuarioActual.getIdpersona().getLugarnacimiento().getIdciudad()==u.getIdpersona().getLugarnacimiento().getIdciudad())){
                              
                              %>
                              <a href="Perfil.jsp?idUsuarioPerfil=<%=u.getIdusuario()%>" class="list-group-item"><%= u.getIdpersona().getNombres() + " " + u.getIdpersona().getApellidos() %></a>
                              <%
                                    }
                                   }
                                }
                              %>
                          </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                      </div>
                    </div>

                  </div>
                </div>
                
                <div class="padding">
                    <div class="full col-sm-12 col-lg-offset-3">
                      
                        <!-- content -->                      
                      	<div class="row">
                          
                         <!-- main col left --> 
                         <div class="col-sm-5">
                               
                             <div class="well" id ="post"> 
                                   <form class="form-horizontal" role="form" action="/parcial2_grupo6/CRUDServlet" method="POST">
                                    <h4>¿Qué hay de nuevo?</h4>
                                     <div class="form-group" style="padding:14px;">
                                         <textarea name ="post" id="post" class="form-control" placeholder="Actualiza tu estado" required="required" ></textarea>
                                    </div>
<!--                                    <label name="tipoPost" value="1" hidden></label>-->
                                    <button class="btn btn-primary pull-right" type="submit">Publicar</button>
                                    
                                    
                                  </form>
                                 <ul class="list-inline" id="botonFoto">
                                     <li><button id ="subirFoto" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Subir nueva foto a tu muro" onclick="subirFoto()"><i class="glyphicon glyphicon-camera"></i></button></li>                                      
                                     <li><button id ="subirAlbum" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Crear un nuevo Album" onclick="subirAlbum()"><i class="fa fa-th"></i></button></li>
                                 </ul>
                                 
                              </div>
                             
                             <!-- Foto en el muro modal -->
                             <div id="subirFotoModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                  <!-- Modal content-->
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                                      <h4 class="modal-title">Publicar una foto en tu muro</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group" style="padding:14px;">
                                           
                                           
                                            <div class="well">
                                                <form class="form-horizontal" role="form" action="/parcial2_grupo6/agregarFotoServlet" method="POST" enctype="multipart/form-data">
                                                  Selecciona la foto:<input name="archivo" id="fotoASubir" type="file" required="required"  accept="image/*"></input><br/>
                                                  <!--<div class="form-group" style="padding:14px; border:solid 1px blue;">-->
                                                      <textarea name ="fotoDescripcion" id="fotoDescripcion" class="form-control" placeholder="Descripción"></textarea>
                                              </div>
                                                      
                                                 <!--</div>-->
                                                 <label name="tipoPost" value="2" hidden></label><br/>
                                                 <button class="btn btn-primary center-block" type="submit">Publicar</button>
                                                </form>
                                            
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                  </div>

                                </div>
                              </div>
                             
                             <!--Crear un album modal-->
                             <div id="subirAlbumModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                  <!-- Modal content-->
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                                      <h4 class="modal-title">Crear un nuevo album de fotos</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group" style="padding:14px;">
                                           
                                           
                                            <div class="well">
                                                <form class="form-horizontal" role="form" action="/parcial2_grupo6/agregarAlbumServlet" method="POST" enctype="multipart/form-data">
                                                    <input name ="nombreAlbum" id="nombreAlbum" class="form-control" placeholder="Nombre del Album" required="required"></input><br/>
                                                    Selecciona las fotos:<input name="archivo" id="fotoASubir" type="file" required="required"  accept="image/*" multiple></input><br/>
                                                  <!--<div class="form-group" style="padding:14px; border:solid 1px blue;">-->
                                                      <textarea name ="fotoDescripcion" id="fotoDescripcion" class="form-control" placeholder="Descripción"></textarea>
                                              </div>
                                                      
                                                 <!--</div>-->
                                                 <label name="tipoPost" value="2" hidden></label><br/>
                                                 <button class="btn btn-primary center-block" type="submit">Publicar</button>
                                                </form>
                                            
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                  </div>

                                </div>
                              </div>
                        <!-- Cargando Post -->
                        
                        <% 
                            List<Posts> listaPost = listaPost =postsFacade.findAll(); //usuarioActual.getPostsList(); // 
                            
                            Collections.reverse(listaPost);                             
                            for(Posts p : listaPost){
                                System.out.println(p.getDescripcion());
                                String idPost = p.getIdpost().toString();
                                if(p.getIdusuario().equals(usuarioActual)||listaDeAmigos.contains(p.getIdusuario()))
                                {
                        %>
                         <div class="col-md-12">
                           <div class="panel panel-white post panel-shadow">
                               <div class="post-heading">
                                   <div class="pull-left image">
                                    <!--  <img src="fotos/tech-dhl-delivery-drones.jpg" class="img-rounded avatar" alt="user profile image">
                               --></div>
                                   <div class="pull-left meta">
                                       <div class="title h5">
                                           <%if(p.getEmisorusuario()==null){%>
                                           <a href="Perfil.jsp?idUsuarioPerfil=<%=p.getIdusuario().getIdusuario()%>" class="text-primary"><%=p.getIdusuario().getIdpersona().getNombres()+" " +p.getIdusuario().getIdpersona().getApellidos() %></a>
                                           ha publicado algo en su muro.
                                       </div>
                                           <h6 class="text-muted time"><%=p.getFechapost()%></h6>
                                           <%}%>
                                           <%if(p.getEmisorusuario()!=null){%>
                                           <a href="Perfil.jsp?idUsuarioPerfil=<%=p.getEmisorusuario().getIdusuario()%>" class="text-primary"><%=p.getEmisorusuario().getIdpersona().getNombres()+" " +p.getEmisorusuario().getIdpersona().getApellidos() %></a>
                                           ha recibido una publicacion de <a href="Perfil.jsp?idUsuarioPerfil=<%=p.getIdusuario().getIdusuario()%>"class="text-primary"><%=p.getIdusuario().getIdpersona().getNombres()+" " +p.getIdusuario().getIdpersona().getApellidos() %></a>
                                    </div>
                                    <h6 class="text-muted time"><%=p.getFechapost()%></h6>
                                    <%}%>        
                                </div>
                            </div>
                            <br>
                            
                            <%
                            List<Imagenes> listaImagenes = imagenesFacade.findAll();
                            %>
                            
                            <%
                            
                            Imagenes imagenPostActual = new Imagenes();
                            if(p.getTipopost().getTipopost()==tipoPostFacade.find(2).getTipopost()){
                                %>
                                <%
                                for(Imagenes i : listaImagenes){
                                    if(i.getIdpost().getIdpost() == p.getIdpost()){
                                        imagenPostActual = imagenesFacade.find(i.getIdimagen());
                                    }
                                }
                                
                                
                            %>
                                
                                 <img src="<%= imagenPostActual.getImagen() %>" class="img-responsive" alt="Foto :D">
                                <%
                            }
                            %>
                            <div class="post-description">
                                <p><em><%=p.getDescripcion()%></em></p>
                                   <div class="stats" id="botonLike<%=idPost%>div">
                                       <%
                                            boolean usuarioLikesPost = false;
                                            int likeId = -1;
                                            List<Likes> listaLikesPost = p.getLikesList();
                                            
                                            for(Likes l : listaLikesPost){
                                                if(l.getIdusuario().getIdusuario() == usuarioActual.getIdusuario()){
                                                    usuarioLikesPost = true;
                                                    likeId = l.getIdlike();
                                                }
                                            }
                                            %>
                                            <input class="text" id="idLikedPost<%=idPost%>" value="<%=likeId%>" type="hidden"></input>
                                            <%
                                            if(usuarioLikesPost){
                                       %>
                                       
                                       <button class="btn btn-primary stat-item" id="like<%=idPost%>" onclick="likes(this,<%=idPost%>)" data-toggle="tooltip" data-placement="bottom" title="Le ha gustado a...<%for(Likes l : listaLikesPost){%>
<%= l.getIdusuario().getIdpersona().getNombres() + " " + l.getIdusuario().getIdpersona().getApellidos()%><%}%>">
                                        <%
                                            } else {
                                        %>
                                        <button class="btn btn-default stat-item" id="like<%=idPost%>" onclick="likes(this,<%=idPost%>)" data-toggle="tooltip" data-placement="bottom" <%if(p.getLikesList().size()<1){%> title="Se el primero en decir me gusta" ><% } else {%>
                                                title="Le ha gustado a...<%for(Likes l : listaLikesPost){%>
<%= l.getIdusuario().getIdpersona().getNombres() + " " + l.getIdusuario().getIdpersona().getApellidos()%><%}%>"><%}%>
                                        <%
                                            }
                                        %>
                                           <i class="fa fa-thumbs-up icon"></i>
                                           <span id = "cantidadLikesPost<%=idPost%>"> <%=p.getLikesList().size()%> </span>
                                       </button>
                                       <div class="btn btn-info stat-item">
                                           <i class="fa fa-comments icon"></i>
                                           <span id = "cantidadCommentPost<%=idPost%>"> <%=p.getComentariosList().size()%> </span>
                                       </div>
                                       
                                   </div>
                            </div>
                               <div class="post-footer">
                                   
                                   <ul class="comments-list" id="<%=p.getIdpost()%>">
                                       <%
                                            List<Comentarios> listaComentarios = p.getComentariosList();
                                            for(Comentarios c : listaComentarios){
                                       %>
                                            <li class="comment">
                                                <a class="pull-left" href="#">
                                                    <!--<img class="avatar" src="img/Friends/guy-3.jpg" alt="avatar">-->
                                                </a>
                                                <div class="comment-body">
                                                    <div class="comment-heading">
                                                        <h4 class="comment-user-name"><a href="#"><%= c.getIdusuario().getIdpersona().getNombres() + " " + c.getIdusuario().getIdpersona().getApellidos() %></a></h4>
                                                        <h5 class="time"> <%=c.getFecha()%> </h5>
                                                    </div>
                                                    <p style="word-break: break-all"><%=c.getComentario()%></p>
                                                </div>
                                            </li>
                                       <%
                                            }
                                       %>
                                                                             
                                   </ul>
                                   <div class="input-group"> 
                                       <input class="form-control" id="agregarComentario<%=p.getIdpost()%>" placeholder="Agrega un comentario" type="text">
                                       <span class="input-group-addon">
                                           <a class="postComentario" id="<%=p.getIdpost()%>"href="javascript:void(0)"><i class="fa fa-edit"></i></a>  
                                       </span>
                                   </div>
                               </div>
                           </div>
                         </div>
                         <%}
                            }%>
                          </div>
                          
                       </div>
                          
                          
                          <!--Footer-->                     

                      
                        <div class="row" id="footer">    
                          <div class="col-sm-6">
                            
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
            } else {
                response.sendRedirect("index.jsp");       
            }
        %>



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
</html>
