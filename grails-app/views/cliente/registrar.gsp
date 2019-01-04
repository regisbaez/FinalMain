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
    <title> Fashion  | Home</title>

</head>

<body>

<div class="reg-form">
    <div class="container">
        <div class="reg">
            <div class="container d-flex flex-column flex-md-row justify-content-end">

                <h3>Regístrate ahora</h3>

            </div>

            <g:form action="salvar">
                <div class="row">

                        <label for="nombre"class="col-sm-2 col-form-label">Nombre</label>
                        <div class="col-sm-10">
                        <input id="nombre" class="form-control " name="nombre" type="text" required>
                        </div>
                </div>

                <br>

                <div class="form-group row">

                        <label for="correo" class="col-sm-2 col-form-label">Correo:</label>
                        <div class="col-sm-10">
                        <input id="correo" class="form-control" name="correo" type="email" value="" required>
                        </div>
                </div>

                <div class="form-group row">
                        <label for="contrasena" class="col-sm-2 col-form-label">Contraseña:</label>
                        <div class="col-sm-10">
                            <input id="contrasena" name="contrasena" class="form-control" type="password" value="" required>
                        </div>
                </div>

                <div class="form-group row">
                        <label for="telefono" class="col-sm-2 col-form-label">Teléfono:</label>
                         <div class="col-sm-10">
                        <input id="telefono" class="form-control" name="telefono" type="text" value="">
                         </div>
                </div>
                <input class="btn btn-secondary" type="submit" value="Registrar">

                <p class="click">Haciendo click en este botón, usted está de acuerdo con <a
                        href="#">Políticas de condiciones y uso.</a></p>
            </g:form>
        </div>
    </div>
</div>



<script>

</script>

</body>
</html>

