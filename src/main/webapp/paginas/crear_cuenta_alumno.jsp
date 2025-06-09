<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Alumno</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-crear-cuenta-alumno.css" />

    </head>

    <body>

        <%@include file="menu.jsp" %> 


        <main class="body">

            <div class="contenido">

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert" id="alert">
                        ${error}
                    </div>
                    <script>
                        setTimeout(() => {
                            const alert = document.getElementById('alert');
                            if (alert) {
                                alert.remove();
                            }
                        }, 5000);
                    </script>
                </c:if> 

                <div class="titulo">
                    <h2>Crea una cuenta</h2>
                    <p>Podrás postular a practicas en un instante.</p>
                </div>
                <form action="${pageContext.request.contextPath}/RegistrarUsuario" method="POST" autocomplete="off">

                    <input type="hidden" name="accion" value="crearCuentaAlumno">

                    <hr>
                    <div class="row">
                        <input type="text" placeholder="Nombre" name="nombre" value="${param.nombre}" required />
                        <input type="text" placeholder="Apellido" name="apellido" value="${param.apellido}" required />
                    </div>

                    <input type="text" pattern="\d{8}" maxlength="8" placeholder="Escribe tu número de DNI" name="dni" value="${param.dni}" required>

                    <select name="universidad" class="selectCampo" required>
                        <option disabled selected>Seleccione una Universidad</option>
                        <option>Universidad Tecnológica del Perú</option>
                        <option>Universidad Tecnológica de los Andes</option>
                        <option>Universidad Señor de Sipán</option>
                        <option>Universidad San Ignacio de Loyola</option>
                        <option>Universidad Ricardo Palma</option>
                        <option>Universidad Privada San Juan Bautista</option>
                        <option>Universidad Privada Norbert Wiener</option>
                        <option>Universidad Privada del Norte</option>
                        <option>Universidad Privada de Trujillo</option>
                        <option>Universidad Privada de Tacna</option>
                        <option>Universidad Privada de Huancayo Franklin Roosevelt</option>
                        <option>Universidad Privada Antenor Orrego</option>
                        <option>Universidad Politécnica del Perú S.A.</option>
                        <option>Universidad Peruana Unión</option>
                        <option>Universidad Peruana Los Andes</option>
                        <option>Universidad Peruana del Centro</option>
                        <option>Universidad Peruana de Ciencias Aplicadas</option>
                        <option>Universidad Peruana Cayetano Heredia</option>
                        <option>Universidad para el Desarrollo Andino</option>
                        <option>Universidad Nacional Toribio Rodríguez de Mendoza de Amazonas</option>
                        <option>Universidad Nacional Tecnológica De Lima Sur</option>
                        <option>Universidad Nacional Santiago Antúnez de Mayolo</option>
                        <option>Universidad Nacional San Luis Gonzaga</option>
                        <option>Universidad Nacional Pedro Ruiz Gallo</option>
                        <option>Universidad Nacional Micaela Bastidas de Apurímac</option>
                        <option>Universidad Nacional Mayor de San Marcos</option>
                        <option>Universidad Nacional José María Arguedas</option>
                        <option>Universidad Nacional José Faustino Sánchez Carrión</option>
                        <option>Universidad Nacional Jorge Basadre Grohmann</option>
                        <option>Universidad Nacional Intercultural Fabiola Salazar Leguía de Bagua</option>
                        <option>Universidad Nacional Intercultural de Quillabamba</option>
                        <option>Universidad Nacional Intercultural de la selva central Juan Santos Atahualpa</option>
                        <option>Universidad Nacional Intercultural de la Amazonia</option>
                        <option>Universidad Nacional Hermilio Valdizán</option>
                        <option>Universidad Nacional Federico Villarreal</option>
                        <option>Universidad Nacional del Santa</option>
                        <option>Universidad Nacional del Centro del Perú</option>
                        <option>Universidad Nacional del Callao</option>
                        <option>Universidad Nacional del Altiplano</option>
                        <option>Universidad Nacional de Ucayali</option>
                        <option>Universidad Nacional de Tumbes</option>
                        <option>Universidad Nacional de Trujillo</option>
                        <option>Universidad Nacional de San Martín</option>
                        <option>Universidad Nacional de San Cristóbal de Huamanga</option>
                        <option>Universidad Nacional de San Antonio Abad del Cusco</option>
                        <option>Universidad Nacional de San Agustín</option>
                        <option>Universidad Nacional de Piura</option>
                        <option>Universidad Nacional de Moquegua</option>
                        <option>Universidad Nacional de la Amazonía Peruana</option>
                        <option>Universidad Nacional de Juliaca</option>
                        <option>Universidad Nacional de Jaén</option>
                        <option>Universidad Nacional de Ingeniería</option>
                        <option>Universidad Nacional de Huancavelica</option>
                        <option>Universidad Nacional de Frontera</option>
                        <option>Universidad Nacional de Educación Enrique Guzmán y Valle</option>
                        <option>Universidad Nacional de Cañete</option>
                        <option>Universidad Nacional de Cajamarca</option>
                        <option>Universidad Nacional de Barranca</option>
                        <option>Universidad Nacional Daniel Alcides Carrión</option>
                        <option>Universidad Nacional Ciro Alegría</option>
                        <option>Universidad Nacional Autónoma de Tayacaja “Daniel Hernández Morillo”</option>
                        <option>Universidad Nacional Autónoma de Huanta</option>
                        <option>Universidad Nacional Autónoma de Chota</option>
                        <option>Universidad Nacional Autónoma de Alto Amazonas</option>
                        <option>Universidad Nacional Autónoma Altoandina de Tarma</option>
                        <option>Universidad Nacional Amazónica de Madre de Dios</option>
                        <option>Universidad Nacional Agraria la Molina</option>
                        <option>Universidad Nacional Agraria de la Selva</option>
                        <option>Universidad María Auxiliadora</option>
                        <option>Universidad Marcelino Champagnat</option>
                        <option>Universidad Le Cordon Bleu S.A.C.</option>
                        <option>Universidad La Salle</option>
                        <option>Universidad Jaime Bausate y Meza</option>
                        <option>Universidad Femenina del Sagrado Corazón</option>
                        <option>Universidad ESAN</option>
                        <option>Universidad del Pacífico</option>
                        <option>Universidad de San Martín de Porres</option>
                        <option>Universidad de Piura</option>
                        <option>Universidad de Lima</option>
                        <option>Universidad de Ingeniería y Tecnología</option>
                        <option>Universidad de Huánuco</option>
                        <option>Universidad de Ciencias y Humanidades</option>
                        <option>Universidad de Ciencias y Artes de América Latina</option>
                        <option>Universidad César Vallejo</option>
                        <option>Universidad Continental</option>
                        <option>Universidad Científica del Sur</option>
                        <option>Universidad Católica Sedes Sapientiae</option>
                        <option>Universidad Católica Santo Toribio de Mogrovejo</option>
                        <option>Universidad Católica San Pablo</option>
                        <option>Universidad Católica de Trujillo Benedicto XVI</option>
                        <option>Universidad Católica de Santa María</option>
                        <option>Universidad Autónoma del Perú</option>
                        <option>Universidad Autónoma de Ica</option>
                        <option>Universidad Antonio Ruiz de Montoya</option>
                        <option>Universidad Andina del Cusco</option>
                        <option>Pontificia Universidad Católica del Perú</option>
                        <option>Facultad de Teología Pontificia y Civil de Lima</option>
                    </select><br>

                    <select name="carrera" class="selectCampo">
                        <option disabled selected>Seleccione su carrera</option>
                        <option>Ingeniería de Sistemas</option>
                        <option>Ingeniería Civil</option>
                        <option>Ingeniería Industrial</option>
                        <option>Ingeniería Electrónica</option>
                        <option>Arquitectura</option>
                        <option>Medicina</option>
                        <option>Derecho</option>
                        <option>Psicología</option>
                    </select>


                    <div class="label-contenido">
                        <label>Ciclo académico</label>
                    </div>
                    <select name="ciclo" required>
                        <option disabled selected>Seleccione un ciclo</option>
                        <option>VII</option>
                        <option>VIII</option>
                        <option>IX</option>
                        <option>X</option>
                    </select>

                    <div class="label-contenido">
                        <label>Género:</label>
                    </div>
                    <div class="row">
                        <label class="gender-option">
                            <input type="radio" name="genero" required value="Femenino"/>
                            Femenino
                        </label>
                        <label class="gender-option">
                            <input type="radio" name="genero" value="Masculino" required/>
                            Masculino
                        </label>
                    </div>

                    <div class="label-contenido">
                        <label>Fecha de nacimiento (AAAA-MM-DD):</label>
                    </div>
                    <input type="text" pattern="\d{4}-\d{2}-\d{2}" name="fecha_nacimiento"
                           placeholder="Escriba su fecha de nacimiento (AAAA-MM-DD)" value="${param.fecha_nacimiento}" required /><br>

                    <input type="tel" name="telefono" pattern="\d{9}" maxlength="9"
                           placeholder="Escriba su numero de telefono" value="${param.telefono}" required><br>

                    <input type="text" name="ubicacion"
                           placeholder="Escriba su ubicación (distr/prov/depart)" value="${param.ubicacion}" required><br>

                    <input type="email" name="email" placeholder="Email" value="${param.email}" required><br>

                    <input type="password" name="contrasena" placeholder="Escribe tu contraseña" required><br>

                    <input type="password" name="confirmarContrasena" placeholder="Confirma tu contraseña" required><br>


                    <p class="info">
                        Al hacer clic en "Registrarte", aceptas nuestras
                        <a href="#">Condiciones</a>, la
                        <a href="#">Política de privacidad</a> y la
                        <a href="#">Política de cookies</a>. 
                    </p>

                    <button type="submit">Registrarte</button>

                    <div class="login-link">
                        <a href="iniciar_sesion.jsp">¿Ya tienes una cuenta?</a>
                    </div>
                </form>
            </div>
        </main>

   
    </body>
</html>
