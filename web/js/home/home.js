var activeSubirFoto = false;
var subirFotoDropzone;

function subirFoto(){
    $("#subirFotoModal").modal();
}

function subirAlbum(){
    $("#subirAlbumModal").modal();
}

function likes(el,idPost){
    //console.log(idPost);
    //console.log(el.className);
    //console.log(likeId);
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
//                   console.log(estadoLike)
//                   if(estadoLike==="AGREGAR"){
//                       document.getElementById("like"+idPost).className = "btn btn-default stat-item";
//                   } else if(estadoLike==="ELIMINAR") {
//                       document.getElementById("like"+idPost).className = "btn btn-primary stat-item";
//                   }
                   console.log("Fallo");
               }
            }
        });
    
}
function agregarDropzone(){
//    $("#subirFoto").click(function(){
//        $("#subirFotoModal").modal();
//    });
//    
//    $("#subirAlbum").click(function(){
//        $("#subirAlbumModal").modal();
//    });
   if(activeSubirFoto){
       $('#dropzoneSubirFoto').remove();
       activeSubirFoto = false;
   } else {
       $('#post.well').append('<form id="dropzoneSubirFoto" action="/parcial2_grupo6/agregarFotoServlet" class="dropzone" enctype="multipart/form-data">'+
                              '<div class="dz-message">'+
                               'Arroja o haz click para subir una foto.<br />'+
                               '<span class="note">(Ojala que sea una buena foto. Si la foto <strong>no</strong> te gusta, solamente dale a remove.)</span>'+
                               '</div>'+
                               '<br/><button align="center" id ="subirFotoReady" class="btn btn-success" onclick="subirImagen()"><i class="fa fa-upload"></i></button> '+
                '</form>');
       activeSubirFoto = true;
       subirFotoDropzone = new Dropzone("#dropzoneSubirFoto", {
            url : "/parcial2_grupo6/agregarFotoServlet",
            autoProcessQueue : true,
            paramName : "archivo",
            acceptedFiles : "image/*",
            maxFiles : 1,
            parallelUploads : 1,
            dictRemoveFile : "Eliminar foto",
            addRemoveLinks : true,
	    uploadMultiple : false,
            clickable : true,
            
            
            
            
            /*paramName : "archivo",
		maxFilesize : 10, // MB
		acceptedFiles : "image/*",
                url : "/parcial2_grupo6/agregarFotoServlet",
		addRemoveLinks : true,
		clickable : true,
		autoProcessQueue : false,
		maxFiles : 1,
		parallelUploads : 1,
		dictRemoveFile : "Remove file",
		uploadMultiple : false,*/
            
                
//		addedfile: function(a) {
//            var c = this;
//            return a.previewElement = Dropzone.createElement(this.options.previewTemplate), 
//            a.previewTemplate = a.previewElement, 
//            this.previewsContainer.appendChild(a.previewElement), 
//            a.previewElement.querySelector("[data-dz-name]").textContent = a.name, 
//            a.previewElement.querySelector("[data-dz-size]").innerHTML = this.filesize(a.size), 
//            this.options.addRemoveLinks && (a._removeLink = 
//            	Dropzone.createElement('<a class="btn btn-sm btn-danger btn-block" href="javascript:undefined;">' + this.options.dictRemoveFile + "</a>"), 
//            	a._removeLink.addEventListener("click", function() {
//            		Company.deleteImage(a,c);
//            }), a.previewElement.appendChild(a._removeLink)),this._updateMaxFilesReachedClass()},
//        init: function() {
//            this.on("addedfile", function() {
//              if (this.files[1]!=null){
//                this.removeFile(this.files[0]);
//              }
//            });},
//            success:function(a,b){
//         	   a.id = b.data;
//         	   $("#logoId").val(b.data);
//            }

	});
        
   }    
  
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
    
    
    Dropzone.autoDiscover = false;
    
     subirFotoDropzone;
});
