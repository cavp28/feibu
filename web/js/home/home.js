var activeSubirFoto = false;

function like(botonPost) {
    var boton = $('#' + botonPost);
    var divs = $('#' + botonPost + 'div');
    divs.addClass("stats");
    boton.toggleClass("btn btn-default stat-item");
    console.log("entro");
}

function agregarDropzone(){
   if(activeSubirFoto){
       $('#dropzoneSubirFoto').remove();
       activeSubirFoto = false;
   } else {
       $('#post.well').append('<form id="dropzoneSubirFoto" action="/parcial2_grupo6/agregarFotoServlet" class="dropzone" enctype="multipart/form-data">'+
                              '<div class="dz-message">'+
                               'Arroja o haz click para subir una foto.<br />'+
                               '<span class="note">(Ojala que sea una buena foto. Si la foto <strong>no</strong> te gusta, solamente dale a remove.)</span>'+
                               '</div>'+  
                '</form>');
       activeSubirFoto = true;
        subirFotoDropzone = new Dropzone("#dropzoneSubirFoto", {
		paramName : "archivo",
		maxFilesize : 10, // MB
		acceptedFiles : "image/*",
		addRemoveLinks : true,
		clickable : true,
		autoProcessQueue : true,
		maxFiles : 1,
		parallelUploads : 1,
		dictRemoveFile : "Remove file",
		uploadMultiple : false,
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
    
   
    
});