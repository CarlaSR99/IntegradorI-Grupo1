
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIAR</title>
        <link rel="stylesheet" href="../css/style-iniciar-session.css"/>
    </head>
    <body>

        <%@include file="menu.jsp" %>

        <main class="main">
            <div class="login-card">
                <h2>Iniciar Sesión</h2>
                <form action="../Login" method="POST">
                    <div class="form-group">
                        <input type="email" name="email" placeholder="Escriba su email" required>
                    </div>
                    <div class="form-group password-group">
                        <input type="password" name="contrasena" id="password" placeholder="Escriba su contraseña" required>
                        <span id="togglePassword" class="toggle-password">🙈</span>
                    </div>
                    <div class="forgot-password">
                        <a href="#">¿Olvidó su contraseña?</a>
                    </div>
                    <button type="submit" class="btn-login">Iniciar Sesión</button>
                </form>
            </div>
        </main>
        <script>
            const togglePassword = document.getElementById('togglePassword');
            const passwordField = document.getElementById('password');
            togglePassword.addEventListener('click', () => {
                const isPassword = passwordField.getAttribute('type') === 'password';
                passwordField.setAttribute('type', isPassword ? 'text' : 'password');
                togglePassword.textContent = isPassword ? '🙉' : '🙈';
            });
        </script>

    </body>
</html>
