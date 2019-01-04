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
    %{--<title>Karl - Fashion Ecommerce Template | Home</title>--}%

    <!-- Favicon  -->
    %{--<link rel="icon" href="/assets/img/core-img/favicon.ico">--}%

</head>

<body>

<div class="shop-grid">
    <!-- normal -->
    <div class="container">

    <div class="row">
    <g:each in="${articulos}" var="articulo">
        <div class="col-md-4">

            <div class="card mb-4 shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect fill="#55595c" width="100%" height="100%"></rect><text fill="#eceeef" dy=".3em" x="50%" y="50%">Thumbnail</text></svg>
                <div class="card-body">
                    <p class="card-text">${articulo.nombre}</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <button type="button" onclick="window.location.href= '/articulo/show?id=${articulo.id}'" class="btn btn-sm btn-outline-secondary">Ver</button>
                        </div>
                        <small class="text-muted">${articulo.descripcion}</small>
                    </div>
                </div>
            </div>

        </div>
    </g:each>
        </div>




    <nav aria-label="Page navigation" class="text-center">

        <ul class="pagination">

            <g:each in="${1..paginas}" var="pagina">

                <li class="${pagina -1} page-item"><a class="page-link"  href="/articulo/index?offset=${pagina - 1}">${pagina}</a></li>

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


    });
</script>

</body>
</html>
