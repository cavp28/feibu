function likes(el,idPost){
   var estadoLike;
    if(el.className === "btn btn-default stat-item"){
        document.getElementById("like"+idPost).className = "btn btn-primary stat-item";
        estadoLike = "AGREGAR";
    } else {
        document.getElementById("like"+idPost).className = "btn btn-default stat-item";
        estadoLike = "ELIMINAR";
    }
     var idLike = document.getElementById("idLikedPost"+idPost);
    $.ajax({
            url: "agregarLikeServlet",
            method: "POST",
            data: {idPost: idPost,
                   estadoLike: estadoLike,
                   idLike: idLike.value},
            dataType: "json",
            success: function(a,b,c){
                if(a.Status==="EXITO"){                   
                         
                    $('#cantidadLikesPost'+ idPost).html(a.cantidadLikes);
                   
                    if(estadoLike ==="AGREGAR"){
                        idLike.value = a.idLike;
                        console.log(idLike.value);
                    }
                    
                  
               } else if(a.Status==="FALLO"){
                   console.log("Fallo");
               }
            }
        });
    
}

function agregarAmigo(idUsuarioASolicitar){
    $.ajax({
        url: "agregarAmigoServlet",
        method: "POST",
        data: {
            idUsuarioASolicitar: idUsuarioASolicitar
        },
        dataType: "json",
        success: function(a,b,c){
            if(a.Status==="EXITO"){
                
                    document.getElementById("iconoEstatusAmistad").className = "fa fa-clock-o";
                    document.getElementById("botonAgregar").className = "btn btn-warning btn-fill pull-right";     
                    $('#estatusAmistad').html("Solicitud Enviada");
                    
                  
               } else if(a.Status==="FALLO"){
                   console.log("Fallo");
               }
        }
        
    });
    
}

$(document).ready(function () {
    
    $('.postComentario').on('click', function () { 
        console.log("Entro!");
        var idPost = $(this).attr('id');
        var comentario = $('#agregarComentario' + idPost).val();
        
        $.ajax({
            url: "agregarComentarioServlet",
            method: "POST",
            data: {comentario: comentario,
                   idPost: idPost},
            dataType: "json",
            success: function(a,b,c){
                if(a.Status==="EXITO"){
                    
                   $('#agregarComentario' + idPost).val('');
                   $('#' + idPost+ '.comments-list').append('<li class="comment"> '+
                                                '<a class="pull-left" href="#">'+
                                                    '<!--<img class="avatar" src="img/Friends/guy-3.jpg" alt="avatar">-->'+
                                                '</a>'+
                                                '<div class="comment-body">'+
                                                    '<div class="comment-heading">'+
                                                        '<h4 class="comment-user-name"><a href="#">' + a.usuario + '</a></h4>'+
                                                        '<h5 class="time">'+ new Date() +' </h5>'+
                                                    '</div>'+
                                                    '<p style="word-break: break-all">'+ comentario +'</p>'+
                                                '</div>'+
                                            '</li>');
                    
                    
                    $('#cantidadCommentPost'+ idPost).html(a.cantidadComentarios);
                    
                  
               } else if(a.Status==="FALLO"){
                   $('#agregarComentario' + idPost).css('border', 'solid 1px red');
                   $('#agregarComentario' + idPost).val('');
                   $('#agregarComentario' + idPost).attr('placeholder','Error Guardando');
               }
            }
        });
    });
    
});
