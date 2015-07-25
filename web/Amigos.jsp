<%-- 
    Document   : Informacion
    Created on : Jul 23, 2015, 10:16:44 PM
    Author     : david
--%>
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
  
<!-- Mirrored from dee-dee.bootdey.com/friends.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 22 Jul 2015 16:38:16 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="bootstrap social network template">
    <meta name="author" content="">
    <link rel="icon" href="img/logo.png">
    <title>Feibú</title>

    <link href="bootstrap-3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="GSDK_production_1.3/css/get-shit-done.css" rel="stylesheet" />
    <link href="GSDK_production_1.3/css/demo.css" rel="stylesheet" />  
    <link href="assets/css/animate.min.css" rel="stylesheet" /> 
    <link href="assets/css/timeline.css" rel="stylesheet" /> 
    <link href="assets/css/rotating-card.css" rel="stylesheet" /> 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
  </head>
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
              <a class="navbar-brand" href="#">
                <img class="app-logo" src="img/logo.png">
                <b>Feibú</b>
              </a>
            </div>
            <%if (request.getParameter("idPerfil")!=null){
                Usuarios usuario = null;
                usuario=usuariosFacade.find(Integer.parseInt(request.getParameter("idPerfil")));
            %>
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
                <li><a href="home.jsp"><i class="fa fa-tasks"></i>Home</a></li>
                <li><a href="about.html"><i class="fa fa-info-circle"></i>About</a></li>
                <li class="active"><a href="amigos.jsp"><i class="fa fa-users"></i>Amigos</a></li>
                <li><a href="photos.html"><i class="fa fa-file-image-o"></i>Photos</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="blurred-container">
          <!-- Cover images -->
          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
              <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
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
      <h4 class="text-center user-name hidden-xs"><%=usuario.getIdpersona().getNombres()+" "+
                                                    usuario.getIdpersona().getApellidos()%></h4>
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
      </div>
      <!-- timeline container-->
      <div class="container container-timeline animated fadeIn">
        <div class="row">
          <div class="panel panel-default panel-friends">
            <div class="panel-heading">
              <h3 class="panel-title">Amigos</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                  <!-- friend -->
                  <div class="col-md-4 col-sm-6">
                    <div class="card-container">
                      <div class="card">
                          <div class="front">
                              <div class="cover">
                                  <img src="img/Friends-Cover/rotating_card_thumb2.png"/>
                              </div>
                              <div class="user">
                                  <img class="img-circle" src="img/Friends/guy-2.jpg"/>
                              </div>
                              <div class="content">
                                  <div class="main">
                                      <h3 class="name">John Marvel</h3>
                                  </div>
                                  <div class="footer">
                                      <div class="rating">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                      </div>
                                  </div>
                              </div>
                          </div> <!-- end front panel -->
                          <div class="back">
                              <div class="header"></div> 
                              <div class="content">
                                  <div class="main">
                                      <h5><i class="fa fa-map-marker fa-fw text-muted"></i> Paris, France</h5>
                                      <h5><i class="fa fa-building-o fa-fw text-muted"></i> Creative Tim Inc. </h5>
                                      <h5><i class="fa fa-envelope-o fa-fw text-muted"></i> john@creative-tim.com</h5>
                                  </div>
                              </div>
                              <div class="footer"> </div>
                          </div> <!-- end back panel -->
                      </div> <!-- end card -->
                    </div> <!-- end card-container -->
                  </div> <!-- end friend -->

                  <!-- ============= friend ===============-->
                  <div class="col-md-4 col-sm-6">
                    <div class="card-container">
                      <div class="card">
                          <div class="front">
                              <div class="cover">
                                  <img src="img/Friends-Cover/rotating_card_thumb.png"/>
                              </div>
                              <div class="user">
                                <img class="img-circle" src="img/Friends/woman-1.jpg"/>
                              </div>
                              <div class="content">
                                  <div class="main">
                                      <h3 class="name">Andrew Mike</h3>
                                  </div>
                                  <div class="footer">
                                      <div class="rating">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                      </div>
                                  </div>
                              </div>
                          </div> <!-- end front panel -->
                          <div class="back">
                              <div class="header"></div> 
                              <div class="content">
                                  <div class="main">
                                      <h5><i class="fa fa-map-marker fa-fw text-muted"></i> Paris, France</h5>
                                      <h5><i class="fa fa-building-o fa-fw text-muted"></i> Creative Tim Inc. </h5>
                                      <h5><i class="fa fa-envelope-o fa-fw text-muted"></i> john@creative-tim.com</h5>
                                  </div>
                              </div>
                              <div class="footer"> </div>
                          </div> <!-- end back panel -->
                      </div> <!-- end card -->
                    </div> <!-- end card-container -->
                  </div> <!-- end friend -->

                  <!-- ============= friend ===============-->
                  <div class="col-md-4 col-sm-6">
                    <div class="card-container">
                      <div class="card">
                          <div class="front">
                              <div class="cover">
                                  <img src="img/Friends-Cover/rotating_card_thumb3.png"/>
                              </div>
                              <div class="user">
                                  <img class="img-circle" src="img/Friends/woman-3.jpg"/>
                              </div>
                              <div class="content">
                                  <div class="main">
                                      <h3 class="name">Inna Corman</h3>
                                  </div>
                                  <div class="footer">
                                      <div class="rating">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                      </div>
                                  </div>
                              </div>
                          </div> <!-- end front panel -->
                          <div class="back">
                              <div class="header"></div> 
                              <div class="content">
                                  <div class="main">
                                      <h5><i class="fa fa-map-marker fa-fw text-muted"></i> Paris, France</h5>
                                      <h5><i class="fa fa-building-o fa-fw text-muted"></i> Creative Tim Inc. </h5>
                                      <h5><i class="fa fa-envelope-o fa-fw text-muted"></i> john@creative-tim.com</h5>
                                  </div>
                              </div>
                              <div class="footer"> </div>
                          </div> <!-- end back panel -->
                      </div> <!-- end card -->
                    </div> <!-- end card-container -->
                  </div> <!-- end friend -->


                  <!-- ============= friend ===============-->
                  <div class="col-md-4 col-sm-6">
                    <div class="card-container">
                      <div class="card">
                          <div class="front">
                              <div class="cover">
                                  <img src="img/Friends-Cover/rotating_card_thumb3.png"/>
                              </div>
                              <div class="user">
                                  <img class="img-circle" src="img/Friends/woman-4.jpg"/>
                              </div>
                              <div class="content">
                                  <div class="main">
                                      <h3 class="name">Irina Grandhu</h3>
                                  </div>
                                  <div class="footer">
                                      <div class="rating">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                      </div>
                                  </div>
                              </div>
                          </div> <!-- end front panel -->
                          <div class="back">
                              <div class="header"></div> 
                              <div class="content">
                                  <div class="main">
                                      <h5><i class="fa fa-map-marker fa-fw text-muted"></i> Paris, France</h5>
                                      <h5><i class="fa fa-building-o fa-fw text-muted"></i> Creative Tim Inc. </h5>
                                      <h5><i class="fa fa-envelope-o fa-fw text-muted"></i> john@creative-tim.com</h5>
                                  </div>
                              </div>
                              <div class="footer"> </div>
                          </div> <!-- end back panel -->
                      </div> <!-- end card -->
                    </div> <!-- end card-container -->
                  </div> <!-- end friend -->

                  <!-- ============= friend ===============-->
                  <div class="col-md-4 col-sm-6">
                    <div class="card-container">
                      <div class="card">
                          <div class="front">
                              <div class="cover">
                                  <img src="img/Friends-Cover/rotating_card_thumb2.png"/>
                              </div>
                              <div class="user">
                                  <img class="img-circle" src="img/Friends/woman-5.jpg"/>
                              </div>
                              <div class="content">
                                  <div class="main">
                                      <h3 class="name">Maria Khranma</h3>
                                  </div>
                                  <div class="footer">
                                      <div class="rating">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                      </div>
                                  </div>
                              </div>
                          </div> <!-- end front panel -->
                          <div class="back">
                              <div class="header"></div> 
                              <div class="content">
                                  <div class="main">
                                      <h5><i class="fa fa-map-marker fa-fw text-muted"></i> Paris, France</h5>
                                      <h5><i class="fa fa-building-o fa-fw text-muted"></i> Creative Tim Inc. </h5>
                                      <h5><i class="fa fa-envelope-o fa-fw text-muted"></i> john@creative-tim.com</h5>
                                  </div>
                              </div>
                              <div class="footer"> </div>
                          </div> <!-- end back panel -->
                      </div> <!-- end card -->
                    </div> <!-- end card-container -->
                  </div> <!-- end friend -->

                  <!-- ============= friend ===============-->
                  <div class="col-md-4 col-sm-6">
                    <div class="card-container">
                      <div class="card">
                          <div class="front">
                              <div class="cover">
                                  <img src="img/Friends-Cover/rotating_card_thumb.png"/>
                              </div>
                              <div class="user">
                                  <img class="img-circle" src="img/Friends/woman-6.jpg"/>
                              </div>
                              <div class="content">
                                  <div class="main">
                                      <h3 class="name">sharyl Grandhu</h3>
                                  </div>
                                  <div class="footer">
                                      <div class="rating">
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                          <i class="fa fa-star"></i>
                                      </div>
                                  </div>
                              </div>
                          </div> <!-- end front panel -->
                          <div class="back">
                              <div class="header"></div> 
                              <div class="content">
                                  <div class="main">
                                      <h5><i class="fa fa-map-marker fa-fw text-muted"></i> Paris, France</h5>
                                      <h5><i class="fa fa-building-o fa-fw text-muted"></i> Creative Tim Inc. </h5>
                                      <h5><i class="fa fa-envelope-o fa-fw text-muted"></i> john@creative-tim.com</h5>
                                  </div>
                              </div>
                              <div class="footer"> </div>
                          </div> <!-- end back panel -->
                      </div> <!-- end card -->
                    </div> <!-- end card-container -->
                  </div> <!-- end friend -->
                </div>
              </div>
            </div>
            <div class="panel-footer">
              <button type="button" class="btn btn-block">
                <i class="fa fa-refresh"></i>
                Load more..
              </button>
            </div>
          </div>
        </div>
      </div><!-- timeline container-->
      <div class="space"></div>
    </div>
    <%}else{response.sendRedirect("index.jsp");}%>
  </body>
  <script src="assets/js/jquery.1.11.1.min.js" type="text/javascript"></script>
  <script src="bootstrap-3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="GSDK_production_1.3/js/gsdk-bootstrapswitch.js"></script>
  <script src="GSDK_production_1.3/js/get-shit-done.js"></script>
  <script src="assets/js/custom.js"></script>


<!-- Mirrored from dee-dee.bootdey.com/friends.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 22 Jul 2015 16:38:36 GMT -->
</html>
