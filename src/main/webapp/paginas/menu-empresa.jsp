

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/style-perfil-empresa.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>

<header>
    <nav class="navbar bg-dark p-3 ">
        <div class="container">
            <a class="navbar-brand text-light fs-1">Emplea<span class="text-danger">U</span></a>
            <form class="d-flex" method="POST" action="${pageContext.request.contextPath}/CerrarSesion">
                <a href="#" class="btn btn-secondary me-4 p-3 fs-5">Mi perfil</a>
                <a href="#" class="btn btn-secondary me-4 p-3 fs-5">Mis puestos</a>

                <button type="submit" class="btn btn-danger p-3 fs-5">Cerrar Sesión</button>
            </form>

        </div>
    </nav>
</header>