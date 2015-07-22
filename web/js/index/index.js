$(document).ready(function () {

    $('#paisNacimiento').change(function (event) {
        var paises = $("select#paisNacimiento").val();
        $.get('JsonServlet', {
            idPais: paises
        }, function (response) {

            var select = $('#ciudadNacimiento');
            select.find('option').remove();
            $.each(response, function (index, value) {
                $('<option>').val(value).text(value).appendTo(select);
            });
        });
    });
    
    $('#paisActual').change(function (event) {
        var paises = $("select#paisActual").val();
        $.get('JsonServlet', {
            idPais: paises
        }, function (response) {

            var select = $('#ciudadActual');
            select.find('option').remove();
            $.each(response, function (index, value) {
                $('<option>').val(value).text(value).appendTo(select);
            });
        });
    });
        $('#paisLugar').change(function (event) {
        var paises = $("select#paisLugar").val();
        $.get('JsonServlet', {
            idPais: paises
        }, function (response) {

            var select = $('#ciudadLugar');
            select.find('option').remove();
            $.each(response, function (index, value) {
                $('<option>').val(value).text(value).appendTo(select);
            });
        });
    });
    
    $(function () {
        $("#fechaNacimiento").datepicker({
            changeMonth: true,
            changeYear: true,
            format: 'dd/mm/yyyy'
        });
    });

    
});

