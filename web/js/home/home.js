function like(botonPost){
    var boton = $('#' + botonPost);
    var divs = $('#' + botonPost + 'div');
    divs.addClass("stats");
    boton.toggleClass("btn btn-default stat-item");
    console.log("entro");
}