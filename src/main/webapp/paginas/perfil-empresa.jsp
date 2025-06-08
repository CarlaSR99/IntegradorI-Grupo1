<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Empresa</title>
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


        <section class="perfil-empresa">
            <div class="header">
                <h1>Perfil de Empresa</h1>
                <div class="acciones">
                    <button type="button" class="btn btn-primary me-4 p-3 fs-5" data-bs-toggle="modal"
                            data-bs-target="#agregarOferta">Agregar Oferta</button>
                </div>
            </div>

            <div class="contenedor-info">
                <div class="card-info">
                    <h2>Información General</h2>
                    <p><strong>Email:</strong>${empresa.email}</p>
                    <p><strong>Nombre de marca:</strong> ${empresa.nombre_emp}</p>
                    <p><strong>Razon social:</strong>${empresa.razon_social}</p>
                    <p><strong>RUC:</strong> ${empresa.ruc_emp}</p>
                    <p><strong>Sector:</strong>${empresa.sector}</p>
                    <p><strong>Ubicacion:</strong> ${empresa.direccion}</p>
                    <p><strong>Descripcion:</strong> ${empresa.descripcion_emp}</p>
                    <p><strong>Email:</strong> ${empresa.email}</p>
                    <p><strong>Mision:</strong>${empresa.mision}</p>
                    <p><strong>Vision:</strong>${empresa.vision}</p>
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-primary me-4 p-3 fs-5" data-bs-toggle="modal"
                                data-bs-target="#editarPerfil">Editar Perfil</button>
                    </div>
                </div>

                <div class="card-ofertas">
                    <h2>Ofertas Publicadas</h2>
                    <ul>
                        <li><strong>Practicante de Planeamiento Comercial</strong> - Publicado: 2025-04-10</li>
                        <li><strong>Practicante de Riesgos Financieros</strong> - Publicado: 2025-04-18</li>
                        <li><strong>Practicante de Análisis Económico</strong> - Publicado: 2025-05-01</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- Detalle de ofertas-->
        <div class="bloque-redondeado p-5">
            <h2>Detalle de Ofertas publicadas</h2>
            <div class="row">
                <div class="col-sm-3 p-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title">Titulo de la oferta</h5>
                            <p class="card-text">Aquí ira el detalle de la oferta laboral.</p>
                            <a href="#" class="btn btn-primary">Ver postulaciones</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 p-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title">Titulo de la oferta</h5>
                            <p class="card-text">Aquí ira el detalle de la oferta laboral.</p>
                            <a href="#" class="btn btn-primary">Ver postulaciones</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 p-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title">Titulo de la oferta</h5>
                            <p class="card-text">Aquí ira el detalle de la oferta laboral.</p>
                            <a href="#" class="btn btn-primary">Ver postulaciones</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 p-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title">Titulo de la oferta</h5>
                            <p class="card-text">Aquí ira el detalle de la oferta laboral.</p>
                            <a href="#" class="btn btn-primary">Ver postulaciones</a>
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

        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
