<%-- 
    Document   : Perfil
    Created on : Jul 22, 2015, 4:01:36 PM
    Author     : david
--%>

<%@page import="edu.pucmm.pw.entidades.Likes"%>
<%@page import="edu.pucmm.pw.entidades.Amistades"%>
<%@page import="edu.pucmm.pw.entidades.Comentarios"%>
<%@page import="edu.pucmm.pw.servicios.LikesFacade"%>
<%@page import="edu.pucmm.pw.servicios.PaisesFacade"%>
<%@page import="edu.pucmm.pw.servicios.TipoLugaresFacade"%>
<%@page import="edu.pucmm.pw.servicios.ComentariosFacade"%>
<%@page import="edu.pucmm.pw.servicios.PostsFacade"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="edu.pucmm.pw.entidades.Posts"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.pucmm.pw.entidades.Usuarios"%>
<%@page import="edu.pucmm.pw.servicios.UsuariosFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from dee-dee.bootdey.com/ by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 22 Jul 2015 16:36:58 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="bootstrap social network template">
    <meta name="author" content="">
    <link rel="icon" href="img/logo.png">
    <title>Feibú</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="GSDK_production_1.3/css/get-shit-done.css" rel="stylesheet" />
    <link href="GSDK_production_1.3/css/demo.css" rel="stylesheet" />  
    <link href="assets/css/animate.min.css" rel="stylesheet" /> 
    <link href="assets/css/timeline.css" rel="stylesheet" /> 
    <script src="js/jquery.js"></script>
    <script src="js/perfil/perfil.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
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
 
    %>
  <body>
    <div id="navbar-full">
      <div id="navbar">
        <nav class="navbar navbar-default navbar-transparent navbar-fixed-top" role="navigation">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
                <a class="navbar-brand logo" href="home.jsp">
                f
              </a>
            </div>

      <%Usuarios usuarioActual = null;
        Usuarios usuarioPerfil = null;
      
        //caso base, donde el usuario logueado esta visitando su perfil
        if(request.getSession().getAttribute("idUsuario")!=null && request.getParameter("idUsuarioPerfil")==null){
             usuarioActual = usuariosFacade.find(Integer.parseInt(request.getSession().getAttribute("idUsuario").toString()));%>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li>
                  <a href="#" data-toggle="search" class="hidden-xs"><i class="fa fa-search"></i></a>
                </li>
              </ul>
              <!-- Search form-->
              <form class="navbar-form navbar-left navbar-search-form" role="search">                  
                <div class="form-group">
                  <input type="text" value="" class="form-control" placeholder="Search...">
                </div> 
              </form>
              <ul class="nav navbar-nav navbar-right navbar-opts">
                <li class="active"><a href="home.jsp"><i class="fa fa-tasks fa-2x_"></i>Home</a></li>
                <li><a href="about.html"><i class="fa fa-info-circle fa-2x_"></i>Información</a></li>
                <li><a href="Amigos.jsp?idUsuarioPerfil=<%=usuarioActual.getIdusuario()%>"><i class="fa fa-users fa-2x_"></i>Amigos</a></li>
                <li><a href="albumes.jsp?idUsuarioPerfil=<%=usuarioActual.getIdusuario()%>"><i class="fa fa-file-image-o fa-2x_"></i>Álbumes</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="blurred-container">
          <!-- Cover images -->
          <div id="cover-carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators pull-right">
              <li data-target="#cover-carousel" data-slide-to="0" class="active"></li>
              <li data-target="#cover-carousel" data-slide-to="1" class=""></li>
              <li data-target="#cover-carousel" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <div class="img-src" style="background-image: url('img/Cover/relax.jpg')"></div>
              </div>
              <div class="item">
                <div class="img-src" style="background-image: url('img/Cover/game.jpg')"></div>
              </div>
              <div class="item">
                <div class="img-src" style="background-image: url('img/Cover/corb.jpg')"></div>
              </div>
            </div>
          </div><!-- end cover images -->
        </div>
      </div>
    </div>
    <div class="main">
      <!-- profile image-->
      <img src="img/Profile/profile.jpg" class="profile-photo img-rounded show-in-modal"/>
      <h4 class="text-center user-name hidden-xs"><%=usuarioActual.getIdpersona().getNombres()+" " + usuarioActual.getIdpersona().getApellidos() %></h4>
      <!-- gray section -->
      <div class="section-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-12 profile-opts">
<!--                  <button type="button" class="btn btn-info btn-fill pull-right">
                    <i class="fa fa-user-plus"></i>
                    <span class="hidden-xs">Agregar a amigos</span>
                  </button>     -->
                </div>
            </div>
        </div>
      </div><!-- end gray section -->

      <!-- timeline container-->
      <div class="container container-timeline animated fadeIn">
        <div class="row">
          <div class="col-md-12">
            <!--=================== left content (about, friends, likes...) ===============-->
            <div class="col-md-4 col-sm-5 col-xs-12 col-left col-md-offset-1">
              <div class="row">
                <div class="col-md-12">
                  <div class="panel panel-default panel-user-detail">
                    <div class="panel-body">
                      <ul class="list-unstyled">
                        <li><i class="fa fa-search"></i>De <a href="#"><%=usuarioActual.getIdpersona().getLugarnacimiento().getNombre()%>,
                        <%=usuarioActual.getIdpersona().getLugarnacimiento().getIdpais().getNombre()%></a></li>
                        <% SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); %>
                        <li><i class="fa fa-calendar"></i>Nació el <%=formateador.format(usuarioActual.getIdpersona().getFechanacimiento())%></li>
                        <li><i class="fa fa-rss"></i>Amigos de <a href="#"><%=usuarioActual.getAmistadesList().size()%> personas</a></li>

                      </ul>
                    </div>
                    <div class="panel-footer text-center">
                      <a href="#"><i class="fa fa-share"></i>Leer más...</a>
                    </div>
                  </div>
                </div>
              </div>

              <!-- friends -->
              <div class="row">
                <div class="col-md-12">
                  <div class="panel panel-default panel-friends">
                    <div class="panel-heading">
                      <a href="Amigos.jsp?idUsuarioPerfil=<%=usuarioActual.getIdusuario()%>" class="pull-right">Ver todos&nbsp;<i class="fa fa-share-square-o"></i></a>
                      <h3 class="panel-title"><i class="fa fa-users"></i>&nbsp; Amigos</h3>
                    </div>
                    <div class="panel-body text-center">
                      <ul class="friends">
                        <li>
                            <a href="#">
                                <img src="img/Friends/woman-4.jpg" title="Jhoanath matew" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/woman-3.jpg" title="Martha creawn" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/guy-2.jpg" title="Jeferh smith" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/woman-9.jpg" title="Linda palma" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/guy-9.jpg" title="Lindo polmo" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/guy-5.jpg" title="andrew cartson" class="img-responsive tip">
                            </a>
                        </li>
                      </ul>
                    </div>
                  </div>  
                </div><!-- end friends -->
              </div>

              
            </div><!-- end left content-->

            <!--============= right content (posts) ===========================-->
            <div class="col-md-6 col-sm-7 col-xs-12 col-right">
              <div class="row">
                <div class="col-md-12 col-xs-12">
                  <div class="well well-sm well-social-post">
                    <form id ="formPerfil" name="formPerfil" action="/parcial2_grupo6/CRUDServlet" method="POST">
                        <ul class="list-inline" id='list_PostActions'>
                            <li class='active'><a href='#'><i class="fa fa-edit"></i><span class="hidden-xs">Estado</span></a></li>
                            <li><a href='#'><i class="fa fa-camera"></i><span class="hidden-xs">Imagen</span></a></li>
                            <li><a href='#'><i class="fa fa-photo"></i><span class="hidden-xs">Crear albúm de imágenes</span></a></li>
                        </ul>
                        <textarea id="postPerfil" name="postPerfil"class="form-control" placeholder="¿En qué estás pensando?" required="required"></textarea>
                        <ul class='list-inline post-actions'>
                            <li><a href="#"><span class="glyphicon glyphicon-camera"></span></a></li>
                            <li><a href="#" class='glyphicon glyphicon-user'></a></li>
                            <li><a href="#" class='glyphicon glyphicon-map-marker'></a></li>
                            <li><button type="submit" class='btn btn-info btn-xs btn-fill'>Publicar</button></li>
                        </ul>
                    </form>
                  </div>
                </div>
              </div>

              <div class="row">
                <!-- first post -->
                        
                <% 
                    List<Posts> listaPost = null;
                            
                    listaPost =usuarioActual.getPostsList1(); // 
                    Collections.reverse(listaPost);                             
                    for(Posts p : listaPost){  
                        String idPost = p.getIdpost().toString();
                                
                     %>                
                <div class="col-md-12">
                  <div class="panel panel-white post panel-shadow">
                      <div class="post-heading">
                          <div class="pull-left image">
                              <img src="img/Profile/profile.jpg" class="img-rounded avatar" alt="user profile image">
                          </div>
                            <div class="pull-left meta">
                                <div class="title h5">
                                    <%if(p.getEmisorusuario()==null){%>
                                        <a href="Perfil.jsp?idUsuarioPerfil=<%=p.getIdusuario().getIdusuario()%>" class="text-primary"><%=p.getIdusuario().getIdpersona().getNombres()+" " +p.getIdusuario().getIdpersona().getApellidos() %></a>
                                </div>
                                    <h6 class="text-muted time"><%=p.getFechapost()%></h6><%}%>
                                    <%if(p.getEmisorusuario()!=null){%>
                                        <a href="Perfil.jsp?idUsuarioPerfil=<%=p.getEmisorusuario().getIdusuario()%>" class="text-primary"><%=p.getEmisorusuario().getIdpersona().getNombres()+" " +p.getEmisorusuario().getIdpersona().getApellidos() %></a>
                                        ha recibido una publicacion de <a href="Perfil.jsp?idUsuarioPerfil=<%=p.getIdusuario().getIdusuario()%>"class="text-primary"><%=p.getIdusuario().getIdpersona().getNombres()+" " +p.getIdusuario().getIdpersona().getApellidos() %></a>
                            </div>
                              <h6 class="text-muted time"><%=p.getFechapost()%></h6><%}%>
                          </div>
                        </div>
                        <div class="post-image">
                            <!-- en caso de que el post tenga imagenes --->
                          <!--<img src="img/Post/place-234-87.jpg" class="image show-in-modal" alt="image post">-->
                        </div>
                        <div class="post-description">
                            <p><em><%=p.getDescripcion()%></em></p>
                            <div class="stats" id="botonLike<%=idPost%>div">
                                <button class="btn btn-primary stat-item" id="botonLike<%=idPost%>" onclick="like('botonLike<%=idPost%>')">
                                    <i class="fa fa-thumbs-up icon"></i>
                                    <%=p.getLikesList().size()%>
                                </button>
                                <button class="btn btn-primary stat-item" id="botonLike<%=idPost%>" onclick="like('botonLike<%=idPost%>')">
                                    <i class="fa fa-share icon"></i>
                                    <%=p.getComentariosList().size()%>
                                </button>
                            </div>
                        </div>
                               <div class="post-footer">
                                   <div class="input-group"> 
                                       <input class="form-control" placeholder="Agrega un comentario" type="text">
                                       <span class="input-group-addon">
                                           <a href="#"><i class="fa fa-edit"></i></a>  
                                       </span>
                                   </div>
                                   <ul class="comments-list">
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
                                        <p><%=c.getComentario()%></p>
                                    </div>
                                </li>
                                <%
                                    }
                                %>                                                     
                           </ul>
                        </div>
                    </div>
                </div>
                <%} %><!-- end first post -->
                <!-- end second post -->
              </div>
            </div><!-- end right content-->
          </div>
          <div class="col-md-12 col-sm-12">
            <footer class="footer">
              <P>&copy; Company 2015</P>
            </footer>
          </div>
        </div>
      </div><!-- timeline container-->
      <div class="space"></div>
    </div> 
      <%}
        if(request.getParameter("idUsuarioPerfil")!=null && request.getSession().getAttribute("idUsuario")!=null){
        
        usuarioPerfil = usuariosFacade.find(Integer.parseInt(request.getParameter("idUsuarioPerfil")));
        request.getSession().setAttribute("idUsuarioPerfil", request.getParameter("idUsuarioPerfil"));
        usuarioActual = usuariosFacade.find(Integer.parseInt(request.getSession().getAttribute("idUsuario").toString()));%>
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li>
                  <a href="#" data-toggle="search" class="hidden-xs"><i class="fa fa-search"></i></a>
                </li>
              </ul>
              <!-- Search form-->
              <form class="navbar-form navbar-left navbar-search-form" role="search">                  
                <div class="form-group">
                  <input type="text" value="" class="form-control" placeholder="Search...">
                </div> 
              </form>
              <ul class="nav navbar-nav navbar-right navbar-opts">
                <li class="active"><a href="home.jsp"><i class="fa fa-tasks fa-2x_"></i>Home</a></li>
                <li><a href="about.html"><i class="fa fa-info-circle fa-2x_"></i>Información</a></li>
                <li><a href="Amigos.jsp?idUsuarioPerfil=<%=usuarioPerfil.getIdusuario()%>"><i class="fa fa-users fa-2x_"></i>Amigos</a></li>
                <li><a href="albumes.jsp?idUsuarioPerfil=<%=usuarioPerfil.getIdusuario()%>"><i class="fa fa-file-image-o fa-2x_"></i>Álbumes</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="blurred-container">
          <!-- Cover images -->
          <div id="cover-carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators pull-right">
              <li data-target="#cover-carousel" data-slide-to="0" class="active"></li>
              <li data-target="#cover-carousel" data-slide-to="1" class=""></li>
              <li data-target="#cover-carousel" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <div class="img-src" style="background-image: url('img/Cover/relax.jpg')"></div>
              </div>
              <div class="item">
                <div class="img-src" style="background-image: url('img/Cover/game.jpg')"></div>
              </div>
              <div class="item">
                <div class="img-src" style="background-image: url('img/Cover/corb.jpg')"></div>
              </div>
            </div>
          </div><!-- end cover images -->
        </div>
      </div>
    </div>
    <div class="main">
      <!-- profile image-->
      <img src="img/Profile/profile.jpg" class="profile-photo img-rounded show-in-modal"/>
      <h4 class="text-center user-name hidden-xs"><%=usuarioPerfil.getIdpersona().getNombres()+" " + usuarioPerfil.getIdpersona().getApellidos() %></h4>
      <!-- gray section -->
      <div class="section-gray">
        <div class="container">
            <div class="row">
               <%
                boolean sonAmigos = false;
                boolean aceptado = false;
                List<Amistades> listaAmigos = usuarioActual.getAmistadesList();
                for(Amistades a : listaAmigos){
                    if(a.getSoyamigode().getIdusuario()==usuarioPerfil.getIdusuario()){
                        sonAmigos = true;
                        if(a.getAceptado()){
                            aceptado = true;
                        } 
                    }
                }
                
                if(sonAmigos && aceptado){%>
                   <div class="col-md-12 profile-opts">
                  <button id="botonAgregar" type="button" class="btn btn-success btn-fill pull-right">
                    <i class="fa fa-user"></i>
                    <span class="hidden-xs">Amigos</span>
                  </button>     
                </div>     
                 
               <%     
                } else if(sonAmigos && !aceptado) {
               %>
                <div class="col-md-12 profile-opts">
                  <button id="botonAgregar" type="button" class="btn btn-warning btn-fill pull-right" >
                    <i class="fa fa-clock-o"></i>
                    <span class="hidden-xs">Solicitud Enviada</span>
                  </button>     
                </div>
              <%} else {
               %>
                <div class="col-md-12 profile-opts">
                  <button id="botonAgregar" type="button" class="btn btn-info btn-fill pull-right"  onclick="agregarAmigo(<%=usuarioPerfil.getIdusuario()%>)">
                    <i id="iconoEstatusAmistad" class="fa fa-user-plus"></i>
                    <span class="hidden-xs" id="estatusAmistad">Agregar a amigos</span>
                  </button>     
                </div>
                    <%}%>
            </div>
        </div>
      </div><!-- end gray section -->

      <!-- timeline container-->
      <div class="container container-timeline animated fadeIn">
        <div class="row">
          <div class="col-md-12">
            <!--=================== left content (about, friends, likes...) ===============-->
            <div class="col-md-4 col-sm-5 col-xs-12 col-left col-md-offset-1">
              <div class="row">
                <div class="col-md-12">
                  <div class="panel panel-default panel-user-detail">
                    <div class="panel-body">
                      <ul class="list-unstyled">
                          
                        <li><i class="fa fa-info-circle"></i>De <a href="#"><%=usuarioPerfil.getIdpersona().getLugarnacimiento().getNombre()%>,
                                <%=usuarioPerfil.getIdpersona().getLugarnacimiento().getIdpais().getNombre()%></a></li>
                        <% SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); %>
                        <li><i class="fa fa-calendar"></i>Nació el <%=formateador.format(usuarioPerfil.getIdpersona().getFechanacimiento())%></li>
                        <li><i class="fa fa-rss"></i>Amigos de <a href="#"><%=usuarioPerfil.getAmistadesList().size()%> personas</a></li>
                      </ul>
                    </div>
                    <div class="panel-footer text-center">
                      <a href="#"><i class="fa fa-share"></i>Leer más...</a>
                    </div>
                  </div>
                </div>
              </div>

              <!-- friends -->
              <div class="row">
                <div class="col-md-12">
                  <div class="panel panel-default panel-friends">
                    <div class="panel-heading">
                      <a href="Amigos.jsp?idUsuarioPerfil=<%=usuarioPerfil.getIdusuario()%>" class="pull-right">Ver todos&nbsp;<i class="fa fa-share-square-o"></i></a>
                      <h3 class="panel-title"><i class="fa fa-users"></i>&nbsp; Amigos</h3>
                    </div>
                    <div class="panel-body text-center">
                      <ul class="friends">
                        <li>
                            <a href="#">
                                <img src="img/Friends/woman-4.jpg" title="Jhoanath matew" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/woman-3.jpg" title="Martha creawn" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/guy-2.jpg" title="Jeferh smith" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/woman-9.jpg" title="Linda palma" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/guy-9.jpg" title="Lindo polmo" class="img-responsive tip">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Friends/guy-5.jpg" title="andrew cartson" class="img-responsive tip">
                            </a>
                        </li>
                      </ul>
                    </div>
                  </div>  
                </div><!-- end friends -->
              </div>

            </div><!-- end left content-->
            <%
            if(sonAmigos&&aceptado){
            %>
            <!--============= right content (posts) ===========================-->
            <div class="col-md-6 col-sm-7 col-xs-12 col-right">
              <div class="row">
                <div class="col-md-12 col-xs-12">
                  <div class="well well-sm well-social-post">
                    <form id ="formPerfil" name="formPerfil" action="/parcial2_grupo6/CRUDServlet" method="POST">
                        <ul class="list-inline" id='list_PostActions'>
                            <li class='active'><a href='#'><i class="fa fa-edit"></i><span class="hidden-xs">Estado</span></a></li>
                            <li><a href='#'><i class="fa fa-camera"></i><span class="hidden-xs">Imagen</span></a></li>
                            <li><a href='#'><i class="fa fa-photo"></i><span class="hidden-xs">Crear albúm de imágenes</span></a></li>
                        </ul>
                        <textarea id="postPerfil" name="postPerfil"class="form-control" placeholder="Dile algo a <%=usuarioPerfil.getIdpersona().getNombres()%>" required="required"></textarea>
                        <ul class='list-inline post-actions'>
                            <li><a href="#"><span class="glyphicon glyphicon-camera"></span></a></li>
                            <li><a href="#" class='glyphicon glyphicon-user'></a></li>
                            <li><a href="#" class='glyphicon glyphicon-map-marker'></a></li>
                            <li><button type="submit" class='btn btn-info btn-xs btn-fill'>Publicar</button></li>
                        </ul>
                    </form>
                  </div>
                </div>
              </div>

            <div class="row">
                <!-- first post -->
                        
                <% 
                    List<Posts> listaPost = null;
                            
                    listaPost =usuarioPerfil.getPostsList2(); // 
                    Collections.reverse(listaPost);                             
                    for(Posts p : listaPost){  
                        String idPost = p.getIdpost().toString();
                                
                     %>                
                <div class="col-md-12">
                    <div class="panel panel-white post panel-shadow">
                            <div class="post-heading">
                                <div class="pull-left image">
                                    <!-- <img src="img/Profile/profile.jpg" class="img-rounded avatar" alt="user profile image">
  -->                           </div>
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
                        <div class="post-image">
                            <!-- en caso de que el post tenga imagenes --->
                          <!--<img src="img/Post/place-234-87.jpg" class="image show-in-modal" alt="image post">-->
                        </div>
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
                                           <a class="postComentario" id="<%=p.getIdpost()%>" href="javascript:void(0)"><i class="fa fa-edit"></i></a>  
                                       </span>
                                   </div>
                        </div>
                    </div>
                </div>
                <%} 
            } else {%><!-- Fin de los post -->
            <h3>Privado</h3>
            <%}%>
            </div><!-- end right content-->
          </div>
          <div class="col-md-12 col-sm-12">
            <footer class="footer">
              <P>&copy; Company 2015</P>
            </footer>
          </div>
        </div>
      </div><!-- timeline container-->
      <div class="space"></div>
    </div>
      <%} else{response.sendRedirect("index.jsp");}%>
  
        
  </body>
  <script src="assets/js/jquery.1.11.1.min.js" type="text/javascript"></script>
  <script src="bootstrap-3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="GSDK_production_1.3/js/gsdk-bootstrapswitch.js"></script>
  <script src="GSDK_production_1.3/js/get-shit-done.js"></script>
  <script src="assets/js/jquery.scrollstop.min.js"></script>
  <script src="assets/js/custom.js"></script>


<!-- Mirrored from dee-dee.bootdey.com/ by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 22 Jul 2015 16:38:01 GMT -->
</html>