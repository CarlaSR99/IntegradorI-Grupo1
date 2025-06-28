<link rel="stylesheet" href="css/style-perfil-alumno.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <header>
            <nav class="navbar bg-dark p-3 ">
                <div class="container">
                    <a class="navbar-brand text-light fs-1">Emplea<span class="text-danger">U</span></a>
                    <form class="d-flex" method="POST" action="${pageContext.request.contextPath}/CerrarSesion">
                        <a href="#" class="btn btn-secondary me-4 p-3 fs-5">Empresas</a>
                        <a href="#" class="btn btn-secondary me-4 p-3 fs-5">Mis Postulaciones</a>

                        <button type="submit" class="btn btn-danger p-3 fs-5">Cerrar Sesión</button>
                    </form>

                </div>
            </nav>
        </header>
