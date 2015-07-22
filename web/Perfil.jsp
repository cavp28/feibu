<%-- 
    Document   : Perfil
    Created on : Jul 22, 2015, 4:01:36 PM
    Author     : david
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="edu.pucmm.pw.entidades.Usuarios"%>
<%@page import="edu.pucmm.pw.servicios.UsuariosFacade"%>
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
    %>
  <body>
        <%Usuarios usuarioActual = null;
        if(application.getAttribute("idUsuario")!=null){
                 usuarioActual = usuariosFacade.find(application.getAttribute("idUsuario"));
        }   
        
        if(request.getParameter("idUsuario")!=null){
                usuarioActual = usuariosFacade.find(Integer.parseInt(request.getParameter("idUsuario")));
        }%> 
        
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
                <li class="active"><a href="index-2.html"><i class="fa fa-tasks fa-2x_"></i>Timeline</a></li>
                <li><a href="about.html"><i class="fa fa-info-circle fa-2x_"></i>Información</a></li>
                <li><a href="friends.html"><i class="fa fa-users fa-2x_"></i>Amigos</a></li>
                <li><a href="photos.html"><i class="fa fa-file-image-o fa-2x_"></i>Imágenes</a></li>
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
                  <button type="button" class="btn btn-info btn-fill pull-right">
                    <i class="fa fa-user-plus"></i>
                    <span class="hidden-xs">Agregar a amigos</span>
                  </button>     
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
                          
                        <li><i class="fa fa-suitcase"></i>Trabaja en <a href="#">software development</a></li>
                        <% SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); %>
                        <li><i class="fa fa-calendar"></i>Nació el <%=formateador.format(usuarioActual.getIdpersona().getFechanacimiento())%></li>
                        <li><i class="fa fa-rss"></i>Amigos <a href="#">51 People</a></li>
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
                      <a href="#" class="pull-right">Ver todos&nbsp;<i class="fa fa-share-square-o"></i></a>
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

              <!-- photos-->
              <div class="row">
                <div class="col-md-12">
                  <div class="panel panel-default panel-photos">
                    <div class="panel-heading">
                      <a href="#" class="pull-right">Ver todas&nbsp;<i class="fa fa-share-square-o"></i></a>
                      <h3 class="panel-title"><i class="fa fa-image"></i>&nbsp;Imágenes</h3>
                    </div>
                    <div class="panel-body text-center">
                      <ul class="photos">
                        <li>
                            <a href="#">
                              <img src="img/Photos/1.jpg" alt="photo 1" class="img-responsive show-in-modal">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Photos/2.jpg" alt="photo 2" class="img-responsive show-in-modal">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Photos/3.jpg" alt="photo 3" class="img-responsive show-in-modal">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Photos/4.jpg" alt="photo 4" class="img-responsive show-in-modal">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Photos/5.jpg" alt="photo 5" class="img-responsive show-in-modal">
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="img/Photos/6.jpg" alt="photo 6" class="img-responsive show-in-modal">
                            </a>
                        </li>
                      </ul>
                    </div>
                  </div>  
                </div><!-- end photos -->
              </div>

            </div><!-- end left content-->

            <!--============= right content (posts) ===========================-->
            <div class="col-md-6 col-sm-7 col-xs-12 col-right">
              <div class="row">
                <div class="col-md-12 col-xs-12">
                  <div class="well well-sm well-social-post">
                    <form>
                        <ul class="list-inline" id='list_PostActions'>
                            <li class='active'><a href='#'><i class="fa fa-edit"></i><span class="hidden-xs">Estado</span></a></li>
                            <li><a href='#'><i class="fa fa-camera"></i><span class="hidden-xs">Imagen</span></a></li>
                            <li><a href='#'><i class="fa fa-photo"></i><span class="hidden-xs">Crear albúm de imágenes</span></a></li>
                        </ul>
                        <textarea class="form-control" placeholder="¿En qué estás pensando?"></textarea>
                        <ul class='list-inline post-actions'>
                            <li><a href="#"><span class="glyphicon glyphicon-camera"></span></a></li>
                            <li><a href="#" class='glyphicon glyphicon-user'></a></li>
                            <li><a href="#" class='glyphicon glyphicon-map-marker'></a></li>
                            <li class='pull-right'><a href="#" class='btn btn-info btn-xs btn-fill'>Post</a></li>
                        </ul>
                    </form>
                  </div>
                </div>
              </div>

              <div class="row">
                <!-- first post -->
                <div class="col-md-12">
                  <div class="panel panel-white post panel-shadow">
                      <div class="post-heading">
                          <div class="pull-left image">
                              <img src="img/Profile/profile.jpg" class="img-rounded avatar" alt="user profile image">
                          </div>
                          <div class="pull-left meta">
                              <div class="title h5">
                                  <a href="#" class="post-user-name">Marting lowenyert</a>
                                  ha subido una imagen.
                              </div>
                              <h6 class="text-muted time">5 seconds ago</h6>
                          </div>
                      </div>
                      <div class="post-image">
                          <img src="img/Post/place-234-87.jpg" class="image show-in-modal" alt="image post">
                      </div>
                      <div class="post-description">
                          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique dignissim urna, in dictum mauris sagittis eget. 
                          Integer luctus risus ac diam ultrices, ultricies tempus arcu sollicitudin</p>
                          <div class="stats">
                              <a href="#" class="btn btn-default stat-item btn-responsive">
                                  <i class="fa fa-thumbs-up icon"></i>
                                  228
                              </a>
                              <a href="#" class="btn btn-default stat-item btn-responsive">
                                  <i class="fa fa-share icon"></i>
                                  128
                              </a>
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
                              <li class="comment">
                                  <a class="pull-left" href="#">
                                      <img class="avatar" src="img/Friends/guy-4.jpg" alt="avatar">
                                  </a>
                                  <div class="comment-body">
                                      <div class="comment-heading">
                                          <h4 class="comment-user-name"><a href="#">Markton contz</a></h4>
                                          <h5 class="time">7 minutes ago</h5>
                                      </div>
                                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                                  </div>
                              </li>
                              <li class="comment">
                                  <a class="pull-left" href="#">
                                      <img class="avatar" src="img/Friends/woman-8.jpg" alt="avatar">
                                  </a>
                                  <div class="comment-body">
                                      <div class="comment-heading">
                                          <h4 class="comment-user-name"><a href="#">Yira Cartmen</a></h4>
                                          <h5 class="time">3 minutes ago</h5>
                                      </div>
                                      <p>Lorem ipsum dolor sit amet, consectetur</p>
                                  </div>
                              </li>
                              <li class="comment">
                                  <a class="pull-left" href="#">
                                      <img class="avatar" src="img/Friends/child-1.jpg" alt="avatar">
                                  </a>
                                  <div class="comment-body">
                                      <div class="comment-heading">
                                          <h4 class="comment-user-name"><a href="#">Dora ty bluekl</a></h4>
                                          <h5 class="time">10 seconds ago</h5>
                                      </div>
                                      <p>Lorem ipsum dolor sit amet</p>
                                  </div>
                              </li>
                          </ul>
                      </div>
                  </div>
                </div><!-- end first post -->
                

                <!-- second post -->
                <div class="col-md-12">
                  <div class="panel panel-white post panel-shadow">
                      <div class="post-heading">
                          <div class="pull-left image">
                              <img src="img/Profile/profile.jpg" class="img-rounded avatar" alt="user profile image">
                          </div>
                          <div class="pull-left meta">
                              <div class="title h5">
                                  <a href="#" class="post-user-name">Marting lowenyert</a>
                                  uploaded a photo.
                              </div>
                              <h6 class="text-muted time">5 seconds ago</h6>
                          </div>
                      </div>
                      <div class="post-image">
                          <img src="img/Post/pic1.jpg" class="image show-in-modal" alt="image post">
                      </div>
                      <div class="post-description">
                          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc tristique dignissim urna, in dictum mauris sagittis eget</p>
                          <div class="stats">
                              <a href="#" class="btn btn-default stat-item btn-responsive">
                                  <i class="fa fa-thumbs-up icon"></i>
                                  228
                              </a>
                              <a href="#" class="btn btn-default stat-item btn-responsive">
                                  <i class="fa fa-share icon"></i>
                                  128
                              </a>
                          </div>
                      </div>
                      <div class="post-footer">
                          <div class="input-group"> 
                              <input class="form-control" placeholder="Add a comment" type="text">
                              <span class="input-group-addon">
                                  <a href="#"><i class="fa fa-edit"></i></a>  
                              </span>
                          </div>
                          <ul class="comments-list">
                              <li class="comment">
                                  <a class="pull-left" href="#">
                                      <img class="avatar" src="img/Friends/guy-3.jpg" alt="avatar">
                                  </a>
                                  <div class="comment-body">
                                      <div class="comment-heading">
                                          <h4 class="comment-user-name"><a href="#">Antony andrew lobghi</a></h4>
                                          <h5 class="time">7 minutes ago</h5>
                                      </div>
                                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                                  </div>
                              </li>
                              <li class="comment">
                                  <a class="pull-left" href="#">
                                      <img class="avatar" src="img/Friends/guy-2.jpg" alt="avatar">
                                  </a>
                                  <div class="comment-body">
                                      <div class="comment-heading">
                                          <h4 class="comment-user-name"><a href="#">Jeferh Smith</a></h4>
                                          <h5 class="time">3 minutes ago</h5>
                                      </div>
                                      <p>Lorem ipsum dolor sit amet, consectetur</p>
                                  </div>
                              </li>
                              <li class="comment">
                                  <a class="pull-left" href="#">
                                      <img class="avatar" src="img/Friends/woman-2.jpg" alt="avatar">
                                  </a>
                                  <div class="comment-body">
                                      <div class="comment-heading">
                                          <h4 class="comment-user-name"><a href="#">Maria fernanda coronel</a></h4>
                                          <h5 class="time">10 seconds ago</h5>
                                      </div>
                                      <p>Lorem ipsum dolor sit amet</p>
                                  </div>
                              </li>
                          </ul>
                      </div>
                  </div>
                </div><!-- end second post -->
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
        
  </body>
  <script src="assets/js/jquery.1.11.1.min.js" type="text/javascript"></script>
  <script src="bootstrap-3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="GSDK_production_1.3/js/gsdk-bootstrapswitch.js"></script>
  <script src="GSDK_production_1.3/js/get-shit-done.js"></script>
  <script src="assets/js/jquery.scrollstop.min.js"></script>
  <script src="assets/js/custom.js"></script>


<!-- Mirrored from dee-dee.bootdey.com/ by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 22 Jul 2015 16:38:01 GMT -->
</html>
