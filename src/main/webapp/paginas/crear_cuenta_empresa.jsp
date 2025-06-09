
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Empresa</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-crear-cuenta-empresa.css">
    </head>

    <body>
        <%@include file="menu.jsp" %>

        <main class="body">
            <div class="contenido">

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert" id="alerta">
                        ${error}
                    </div>
                    <script>
                        setTimeout(() => {
                            const alert = document.getElementById("alerta")
                            if (alert) {
                                alert.remove();
                            }
                        }, 5000);
                    </script>
                </c:if>


                <div class="titulo">
                    <h2>Crea una cuenta</h2>
                    <p>Podrás publicar tu oferta laboral en un instante.</p>
                </div>
                <form action="${pageContext.request.contextPath}/RegistrarUsuario" method="POST" autocomplete="off">
                    <hr>
                    <input type="hidden" name="accion" value="crearCuentaEmpresa">

                    <div class="row">
                        <input type="text" name="nombre_emp"placeholder="Nombre de la marca" value="${param.nombre_emp}" required />
                        <input type="text" name="razonSocial"placeholder="Razon social" value="${param.razonSocial}" required />
                    </div>
                    <input type="text" name="ruc" pattern="\d{11}" maxlength="11" placeholder="Escribe el RUC de empresa" value="${param.ruc}" required>          

                    <input type="text" name="sector" placeholder="Escribe el sector dirigido al que va dirigido su empresa" value="${param.sector}" required>

                    <input type="text" name="ubicacion"placeholder="Escribe en donde esta ubicada su empresa" value="${param.ubicacion}" required>  

                    <textarea name="descripcion" placeholder="Escriba una breve descripcion de su empresa" >${param.descripcion}</textarea>

                    <input type="email" name="email" placeholder="Email" value="${param.email}" autocomplete="off" required><br>
                    <input type="password" name="contrasena" placeholder="Escribe tu contraseña" autocomplete="off" required><br>
                    <input type="password" name="confirmarContrasena" placeholder="Confirma tu contraseña" autocomplete="off" required><br>

                    <button type="submit">Registrarte</button>

                    <div class="login-link">
                        <a href="iniciar_sesion.jsp">¿Ya tienes una cuenta?</a>
                    </div>
                </form>
            </div>
        </main>
    </body>

</html>
