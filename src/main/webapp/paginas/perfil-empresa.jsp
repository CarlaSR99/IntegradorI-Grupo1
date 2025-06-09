<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Empresa</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>

        <%
            HttpSession existe = request.getSession(false);

            if (existe == null || existe.getAttribute("usuario") == null) {
                response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
                return;
            }

            String rol = (String) existe.getAttribute("rol");
            if (!"empresa".equals(rol)) {
                response.sendRedirect(request.getContextPath() + "/paginas/no_autorizado.jsp");
                return;
            }
        %>


        <%@include file="menu-empresa.jsp" %>

        <!-- Header Principal -->
        <div class="gradient-bg text-white py-5 mb-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-white rounded-circle p-3 me-3">
                                <i class="bi bi-building text-primary fs-2"></i>
                            </div>
                            <div>
                                <h1 class="mb-1 fw-bold">${empresa.nombre_emp}</h1>
                                <p class="mb-0 opacity-75">${empresa.sector}</p>
                            </div>
                        </div>
                        <div class="d-flex flex-wrap gap-2">
                            <span class="badge bg-light text-dark px-3 py-2">
                                <i class="bi bi-geo-alt me-1"></i>${empresa.direccion}
                            </span>
                            <span class="badge bg-light text-dark px-3 py-2">
                                <i class="bi bi-envelope me-1"></i>${empresa.email}
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4 text-md-end">
                        <button type="button" class="btn btn-light btn-lg px-4 py-3 fw-semibold" 
                                data-bs-toggle="modal" data-bs-target="#agregarOferta">
                            <i class="bi bi-plus-circle me-2"></i>Agregar Oferta
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">

            <!-- Información de la Empresa -->
            <div class="row">
                <div class="col-lg-8 mb-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-white border-0 py-3">
                            <h3 class="mb-0 fw-bold">
                                <i class="bi bi-info-circle text-primary me-2"></i>
                                Información General
                            </h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <strong class="text-muted">Razón Social</strong>
                                        <p class="mb-0 fw-semibold">${empresa.razon_social}</p>
                                    </div>
                                    <div class="info-item">
                                        <strong class="text-muted">RUC</strong>
                                        <p class="mb-0 fw-semibold">${empresa.ruc_emp}</p>
                                    </div>
                                    <div class="info-item">
                                        <strong class="text-muted">Sector</strong>
                                        <span class="badge bg-primary-subtle text-primary px-3 py-2">${empresa.sector}</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <strong class="text-muted">Email</strong>
                                        <p class="mb-0 fw-semibold">${empresa.email}</p>
                                    </div>
                                    <div class="info-item">
                                        <strong class="text-muted">Ubicación</strong>
                                        <p class="mb-0 fw-semibold">
                                            <i class="bi bi-geo-alt text-danger me-1"></i>${empresa.direccion}
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="info-item">
                                <strong class="text-muted">Descripción</strong>
                                <p class="mb-0">${empresa.descripcion_emp}</p>
                            </div>

                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <strong class="text-muted">Misión</strong>
                                        <p class="mb-0">${empresa.mision}</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <strong class="text-muted">Visión</strong>
                                        <p class="mb-0">${empresa.vision}</p>
                                    </div>
                                </div>
                            </div>

                            <div class="text-end mt-4">
                                <button class="btn btn-outline-primary btn-lg px-4" 
                                        data-bs-toggle="modal" data-bs-target="#editarPerfil">
                                    <i class="bi bi-pencil me-2"></i>Editar Perfil
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Ofertas Recientes -->
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-white border-0 py-3">
                            <h3 class="mb-0 fw-bold">
                                <i class="bi bi-briefcase text-success me-2"></i>
                                Ofertas Recientes
                            </h3>
                        </div>  
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3 p-3 bg-light rounded">
                                <div class="bg-primary rounded-circle p-2 me-3">
                                    <i class="bi bi-briefcase text-white"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1 fw-semibold">Practicante de Planeamiento Comercial</h6>
                                    <small class="text-muted">
                                        <i class="bi bi-calendar me-1"></i>2025-04-10
                                    </small>
                                </div>
                                <span class="badge bg-success">Activa</span>
                            </div>

                            <div class="d-flex align-items-center mb-3 p-3 bg-light rounded">
                                <div class="bg-info rounded-circle p-2 me-3">
                                    <i class="bi bi-graph-up text-white"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1 fw-semibold">Practicante de Riesgos Financieros</h6>
                                    <small class="text-muted">
                                        <i class="bi bi-calendar me-1"></i>2025-04-18
                                    </small>
                                </div>
                                <span class="badge bg-success">Activa</span>
                            </div>

                            <div class="d-flex align-items-center mb-3 p-3 bg-light rounded">
                                <div class="bg-warning rounded-circle p-2 me-3">
                                    <i class="bi bi-bar-chart text-white"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1 fw-semibold">Practicante de Análisis Económico</h6>
                                    <small class="text-muted">
                                        <i class="bi bi-calendar me-1"></i>2025-05-01
                                    </small>
                                </div>
                                <span class="badge bg-success">Activa</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Detalle de Ofertas -->
            <div class="card border-0 shadow-sm mb-5">
                <div class="card-header bg-white border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3 class="mb-0 fw-bold">
                            <i class="bi bi-grid text-primary me-2"></i>
                            Todas las Ofertas Publicadas
                        </h3>                
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card border-0 shadow-sm card-hover h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <div class="bg-primary rounded-circle p-2">
                                            <i class="bi bi-briefcase text-white"></i>
                                        </div>
                                        <span class="badge bg-success">Activa</span>
                                    </div>
                                    <h5 class="card-title fw-bold mb-2">Practicante de Marketing Digital</h5>
                                    <p class="card-text text-muted mb-3">Buscamos estudiante proactivo para apoyar en estrategias digitales y análisis de mercado.</p>
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <small class="text-muted">
                                            <i class="bi bi-people me-1"></i>24 postulaciones
                                        </small>
                                        <small class="text-muted">
                                            <i class="bi bi-calendar me-1"></i>Hace 2 días
                                        </small>
                                    </div>
                                    <button class="btn btn-primary w-100">
                                        <i class="bi bi-eye me-2"></i>Ver Postulaciones
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card border-0 shadow-sm card-hover h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <div class="bg-info rounded-circle p-2">
                                            <i class="bi bi-graph-up text-white"></i>
                                        </div>
                                        <span class="badge bg-success">Activa</span>
                                    </div>
                                    <h5 class="card-title fw-bold mb-2">Analista de Datos Jr.</h5>
                                    <p class="card-text text-muted mb-3">Oportunidad para estudiante de estadística o ingeniería en análisis de big data.</p>
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <small class="text-muted">
                                            <i class="bi bi-people me-1"></i>18 postulaciones
                                        </small>
                                        <small class="text-muted">
                                            <i class="bi bi-calendar me-1"></i>Hace 5 días
                                        </small>
                                    </div>
                                    <button class="btn btn-primary w-100">
                                        <i class="bi bi-eye me-2"></i>Ver Postulaciones
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card border-0 shadow-sm card-hover h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <div class="bg-success rounded-circle p-2">
                                            <i class="bi bi-code-slash text-white"></i>
                                        </div>
                                        <span class="badge bg-success">Activa</span>
                                    </div>
                                    <h5 class="card-title fw-bold mb-2">Desarrollador Frontend</h5>
                                    <p class="card-text text-muted mb-3">Práctica profesional en desarrollo web con React y tecnologías modernas.</p>
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <small class="text-muted">
                                            <i class="bi bi-people me-1"></i>31 postulaciones
                                        </small>
                                        <small class="text-muted">
                                            <i class="bi bi-calendar me-1"></i>Hace 1 semana
                                        </small>
                                    </div>
                                    <button class="btn btn-primary w-100">
                                        <i class="bi bi-eye me-2"></i>Ver Postulaciones
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 mb-4">
                            <div class="card border-0 shadow-sm card-hover h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <div class="bg-warning rounded-circle p-2">
                                            <i class="bi bi-bar-chart text-white"></i>
                                        </div>
                                        <span class="badge bg-danger">Finalizada</span>
                                    </div>
                                    <h5 class="card-title fw-bold mb-2">Asistente Contable</h5>
                                    <p class="card-text text-muted mb-3">Práctica en área contable con enfoque en conciliaciones y reportes financieros.</p>
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <small class="text-muted">
                                            <i class="bi bi-people me-1"></i>45 postulaciones
                                        </small>
                                        <small class="text-muted">
                                            <i class="bi bi-calendar me-1"></i>Hace 2 semanas
                                        </small>
                                    </div>
                                    <button class="btn btn-outline-secondary w-100" disabled>
                                        <i class="bi bi-lock me-2"></i>Oferta Finalizada
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Boton Agregar Oferta-->
            <div class="modal fade" id="agregarOferta" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content p-4">
                        <div class="modal-header">
                            <h1 class="modal-title fs-3 text-center w-100 fw-bold" id="exampleModalLabel">Nueva Oferta Laboral
                            </h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Título:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Descripción:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="message-text" class="col-form-label fs-5 w-100 fw-bold">Requisitos:</label>
                                    <textarea class="form-control" id="message-text"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Fecha límite:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Vacantes:</label>
                                    <input type="num" class="form-control" id="recipient-name">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success">Agregar Oferta</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Boton Editar perfil de empresa-->
            <div class="modal fade" id="editarPerfil" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content p-4">
                        <div class="modal-header">
                            <h2 class="modal-title fs-3 text-center w-100 fw-bold" id="exampleModalLabel">Edita tu Perfil
                            </h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Nombre:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Direccion:</label>
                                    <input type="text" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Descripcion:</label>
                                    <input type="num" class="form-control" id="recipient-name">
                                </div>
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label fs-5 w-100 fw-bold">Email:</label>
                                    <input type="num" class="form-control" id="recipient-name">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>    
    </body>
</html>
