<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Alumno</title>
    </head>
    <body>

        <%
            HttpSession existe = request.getSession(false);

            if (existe == null || existe.getAttribute("usuario") == null) {
                response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
                return;
            }

            String rol = (String) existe.getAttribute("rol");

            if (!"estudiante".equals(rol)) {
                response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
                return;
            }
        %>


        <%@include file="menu-alumno.jsp" %>


      <div class="container py-5">
            <!-- Header del Perfil -->
            <div class="row mb-5">
                <div class="col-12">
                    <div class="profile-card">
                        <div class="bg-pattern text-white p-5 position-relative">
                            <div class="row align-items-center">
                                <div class="col-md-3 text-center">
                                    <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSOb8r7spESjC00_J-W5YEdEYhBg_7HggdfLPbgqf0ivA3vqbHt" 
                                         alt="Avatar" class="profile-avatar mb-4">
                                    <div class="d-flex justify-content-center gap-3">
                                        <button class="btn btn-light btn-sm px-4">
                                            <i class="bi bi-pencil me-2"></i>Editar
                                        </button>
                                        <button class="btn btn-outline-light btn-sm px-4">
                                            <i class="bi bi-download me-2"></i>CV
                                        </button>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h1 class="fw-bold mb-3 display-6">${alumno.nombre} ${alumno.apellido}</h1>
                                    <p class="mb-2 opacity-90 fs-5">
                                        <i class="bi bi-mortarboard me-2"></i>${alumno.carrera}
                                    </p>
                                    <p class="mb-2 opacity-90">
                                        <i class="bi bi-building me-2"></i>${alumno.universidad}
                                    </p>
                                    <p class="mb-0 opacity-90">
                                        <i class="bi bi-geo-alt me-2"></i>${alumno.ubicacion}
                                    </p>
                                </div>
                                <div class="col-md-3 text-center text-dark">
                                    <div class="bg-white bg-opacity-20 rounded-4 p-4 backdrop-blur">
                                        <h3 class="fw-bold mb-2">Ciclo ${alumno.ciclo}</h3>
                                        <p class="mb-0 opacity-90">Académico</p>
                                        <div class="mt-3">
                                            <span class="text-dark badge bg-white px-3 py-2">Activo</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <!-- Información Personal -->
                <div class="col-lg-8 mb-4">
                    <div class="card border-0 shadow-sm profile-card">
                        <div class="card-body p-5">
                            <h3 class="section-title">
                                <i class="bi bi-person-circle icon-primary me-3"></i>
                                Información Personal
                            </h3>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <div class="d-flex align-items-center">
                                            <div class="gradient-primary rounded-circle p-3 me-4">
                                                <i class="bi bi-envelope text-white fs-5"></i>
                                            </div>
                                            <div>
                                                <small class="text-muted d-block mb-1">Email</small>
                                                <strong class="fs-6">${alumno.email}</strong>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="info-item">
                                        <div class="d-flex align-items-center">
                                            <div class="gradient-accent rounded-circle p-3 me-4">
                                                <i class="bi bi-telephone text-white fs-5"></i>
                                            </div>
                                            <div>
                                                <small class="text-muted d-block mb-1">Teléfono</small>
                                                <strong class="fs-6">${alumno.telefono}</strong>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="info-item">
                                        <div class="d-flex align-items-center">
                                            <div class="gradient-success rounded-circle p-3 me-4">
                                                <i class="bi bi-card-text text-white fs-5"></i>
                                            </div>
                                            <div>
                                                <small class="text-muted d-block mb-1">DNI</small>
                                                <strong class="fs-6">${alumno.dni}</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="info-item">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-warning rounded-circle p-3 me-4">
                                                <i class="bi bi-calendar text-white fs-5"></i>
                                            </div>
                                            <div>
                                                <small class="text-muted d-block mb-1">Fecha de Nacimiento</small>
                                                <strong class="fs-6">${alumno.fecha_nacimiento}</strong>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="info-item">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-info rounded-circle p-3 me-4">
                                                <i class="bi bi-gender-ambiguous text-white fs-5"></i>
                                            </div>
                                            <div>
                                                <small class="text-muted d-block mb-1">Género</small>
                                                <strong class="fs-6">${alumno.genero}</strong>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="info-item">
                                        <div class="d-flex align-items-center">
                                            <div class="bg-danger rounded-circle p-3 me-4">
                                                <i class="bi bi-geo-alt text-white fs-5"></i>
                                            </div>
                                            <div>
                                                <small class="text-muted d-block mb-1">Ubicación</small>
                                                <strong class="fs-6">${alumno.ubicacion}</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 text-end">

                                <span class="skill-badge">Editar Perfil</span>

                            </div>

                        </div>
                    </div>
                </div>

                <!-- Habilidades y Acciones -->
                <div class="col-lg-4">
                    <!-- Habilidades -->
                    <div class="card border-0 shadow-sm profile-card mb-4">
                        <div class="card-body p-4">
                            <h4 class="section-title">
                                <i class="bi bi-lightbulb icon-warning me-3"></i>
                                Habilidades
                            </h4>
                            <div class="mb-4 text-end">

                                <span class="skill-badge">Agregar Habilidades</span>

                            </div>

                            <!-- Nivel de Habilidades -->
                            <div class="mt-4">
                                <h5 class="fw-bold mb-4">Nivel de Competencias</h5>

                                <div class="mb-4">
                                    <div class="d-flex justify-content-between mb-2">
                                        <small class="fw-bold">Programación</small>
                                        <small class="text-muted fw-semibold">90%</small>
                                    </div>
                                    <div class="progress progress-custom">
                                        <div class="progress-bar progress-bar-gradient" style="width: 90%"></div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <div class="d-flex justify-content-between mb-2">
                                        <small class="fw-bold">Análisis de Datos</small>
                                        <small class="text-muted fw-semibold">75%</small>
                                    </div>
                                    <div class="progress progress-custom">
                                        <div class="progress-bar progress-bar-success" style="width: 75%"></div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <div class="d-flex justify-content-between mb-2">
                                        <small class="fw-bold">Trabajo en Equipo</small>
                                        <small class="text-muted fw-semibold">95%</small>
                                    </div>
                                    <div class="progress progress-custom">
                                        <div class="progress-bar progress-bar-warning" style="width: 95%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <!-- Estado de Perfil -->
                    <div class="mt-4 p-4 bg-light rounded-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="fw-bold">Perfil Completado</span>
                            <span class="badge-custom">92%</span>
                        </div>
                        <div class="progress progress-custom">
                            <div class="progress-bar progress-bar-success" style="width: 92%"></div>
                        </div>
                        <small class="text-muted mt-2 d-block">
                            <i class="bi bi-info-circle me-2"></i>
                            Agrega más Habilidades para completar tu perfil
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>
