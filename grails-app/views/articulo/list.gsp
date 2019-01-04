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

    <!-- Favicon  -->
    %{--<link rel="icon" href="/assets/img/core-img/favicon.ico">--}%

</head>

<body>

<div class="check">
    <!-- normal -->
    <div class="container">

        <g:each in="${articulos}" var="articulo">

            <div class="cart-header">
                <div class="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div>
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc" style="width: 228px;height: 128px">
                        <img src="${articulo.foto}" width="228" height="128" class="img-responsive" alt="">
                    </div>
                    <div class="cart-item-info">
                        <ul class="qty">
                            <li><p>Nombre: ${articulo.nombre}</p></li>
                            <li><p>Cantidad: ${articulo.cantidadDisponible}</p></li>
                            <li><p>Precio: $${articulo.precio}</p></li>
                        </ul>
                        <div class="delivery">
                            <p>Descripción: ${articulo.descripcion}</p>
                            <span>

                                <a class="eliminar" href="/articulo/eliminar?id=${articulo.id}" role="button"><i class="far fa-trash-alt"></i>  &nbsp; Eliminar</a>
                                <a class="editar" href="/articulo/editar?id=${articulo.id}" role="button"><i class="far fa-edit"></i> &nbsp; Editar</a>

                            </span>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>

        </g:each>
    </div>




    <nav aria-label="Page navigation" class="text-center">

        <ul class="pagination">

            <g:each in="${1..paginas}" var="pagina">

                <li class="${pagina -1}"><a  href="/articulo/list?offset=${pagina - 1}">${pagina}</a></li>

            </g:each>

        </ul>
    </nav>
</div>




<script>
    $(document).ready(function () {

        var url_string = window.location.href;
        var url = new URL(url_string);
        var c = url.searchParams.get("offset");

        $('.'+c).addClass("active");


        $('.close2').on('click', function(c){
            $('.cart-header2').fadeOut('slow', function(c){
                $('.cart-header2').remove();
            });
        });

    });





</script>

</body>
</html>
