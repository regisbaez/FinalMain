<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="layout" content="main">


    <!-- Title  -->
    <title>Karl - Fashion Ecommerce Template | Home</title>

</head>

<body>

<div class="alert alert-warning alert-dismissible fade in" id="alerta" style="display: none" role="alert"> <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button> <strong>La imagen debe ser menor a 2 mb</strong>, escoja una imagen de menor tamaño.</div>
<style>

img.resize {
    max-width: 40%;
    max-height: 40%;

    overflow: hidden;
    width: 100%;
}

.slides img {
    float: left;
}
</style>

<div class="specifications">
    <div class="container">
        <h3>Nuevo Artículo</h3>

        <g:form action="actualizar" name="articulo" method="PUT" enctype="multipart/form-data">

            <input hidden name="id" type="number" value="${articulo.id}">

            <div class="form-group">

                <label for="nombre">Nombre</label>
                <input id="nombre" class="form-control" value="${articulo.nombre}" name="nombre" type="text" required>
            </div>


            <div class="form-group">
                <label for="descripcion">Descripción</label>
                <input id="descripcion" class="form-control" value="${articulo.descripcion}" name="descripcion" type="text" width="300px">
            </div>

            <div class="form-group">

                <div class="col-md-4">

                    <label for="cantidad">Cantidad</label>

                    <input id="cantidad" class="form-control "  name="cantidadDisponible" type="number" min="1" value="${articulo.cantidadDisponible}"
                           required>

                </div>

                <div class="col-md-4">

                    <label for="precio">Precio</label>

                    <div class="input-group">
                        <span class="input-group-addon">$</span>
                        <input id="precio" class="form-control " name="precio" type="number" min="1" value="${articulo.precio}" required>

                    </div>
                </div>

                <div class="col-md-4">

                    <label for="images">Imagenes</label>
                    <input type="file" class="form-control" disabled="disabled" id="seleccionarFoto" name="images[]" onchange="preview_images();"
                           data-buttonText="Elegir fotos"/>

                    <input id="images" type="text" hidden name="foto" value="${articulo.foto}">

                </div>

                <div class="col-md-4">
                    <button id="quitar" class="eliminar">Eliminar foto</button>
                </div>
            </div>

            <br>
            <br>

            <div class="form-group">
                <ul>

                    <li class="ad-2-crt simpleCart_shelfItem">

                        <input class="btn" type="submit" href="#" role="button" value="Actualizar"/>
                    </li>
                </ul>
            </div>

        </g:form>

    </div>
</div>

<div class="container">

    <div class="row" id="image_preview">

        <h2>Foto</h2>

        <ul class="slides" id="fotos">

            <img class='img-thumbnail resize' src="${articulo.foto}"/>
        </ul>

    </div>
</div>


<script>

    $(document).ready(function () {

        $('#quitar').on('click', function (e) {

            e.preventDefault();

            quitarFoto();
        })

    });

    function preview_images() {
        var total_file = document.getElementById("seleccionarFoto").files.length;

        if(event.target.files[0].size > 2000000){
            $("#alerta").removeAttr("style");

            document.getElementById('alerta').scrollIntoView();


        }
        else {

            for (var i = 0; i < total_file; i++) {

                $('#fotos').children().remove();

                $('#fotos').append("<img class='img-thumbnail resize' src='" + URL.createObjectURL(event.target.files[i]) + "'>");

                toDataURL(URL.createObjectURL(event.target.files[i]), function (base64) {
                    $('#images').val(base64);

                });
            }

        }
    }

    function toDataURL(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onload = function () {
            var reader = new FileReader();
            reader.onloadend = function () {
                callback(reader.result);
            };
            reader.readAsDataURL(xhr.response);
        };
        xhr.open('GET', url);
        xhr.responseType = 'blob';
        xhr.send();
    }

    function quitarFoto() {

        $('#images').val(" ");
        $('#fotos').children().remove();

        var file = document.getElementById("seleccionarFoto");

        file.removeAttribute('value');
        file.parentNode.replaceChild(file.cloneNode(true),file);

    }

</script>

<asset:javascript src="imagezoom.js"/>
<asset:javascript src="jquery.flexslider.js"/>
<asset:javascript src="cargarImagenes.js"/>
<asset:stylesheet href="flexslider.css"/>

</body>
</html>

