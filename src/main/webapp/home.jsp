<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/home.css">
    </head>

    <body>

        <%@include file="paginas/menu.jsp" %>

        <div class="content">
            <div class="texto">
                <p>Empresas líderes del país están buscando estudiantes como tú para que realicen
                    sus prácticas pre-profesionales junto a ellos. <span>¡Postula ahora!</span></p>

                <div class="formulario">
                    <form action="buscar.php" method="GET">
                        <input type="text" name="empresa" placeholder="Marketing" required>
                        <button type="submit">Buscar</button>
                    </form>
                </div>
            </div>
            <div class="img">
                <img src="img/img.jpg" alt="img">
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    </body>

</html>
