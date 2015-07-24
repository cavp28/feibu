function like(botonPost) {
    var boton = $('#' + botonPost);
    var divs = $('#' + botonPost + 'div');
    divs.addClass("stats");
    boton.toggleClass("btn btn-default stat-item");
    console.log("entro");
}
$(document).ready(function () {
    $('.postComentario').on('click', function () {
        
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