<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<header>
    <nav class="navbar bg-dark p-4">
        <div class="container">
            <a class="navbar-brand text-light fs-1">Emplea<span class="text-danger">U</span></a>
            <div class="d-flex">
                <a class="btn btn-secondary me-4 p-3 fs-5"
                   data-bs-toggle="modal" data-bs-target="#registrerModal">Crear cuenta</a>
                <a href="<%= request.getContextPath()%>/paginas/iniciar_sesion.jsp" class="btn btn-secondary p-3 fs-5">Ingresar</a>
            </div>
        </div>
    </nav>
</header>  

<!-- Modal -->
<div class="modal fade" id="registrerModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-center fw-bold w-100" id="modalTitle">
                    ¡Bienvenido! Crea tu cuenta
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- Estudiante -->
                    <div class="col-sm-6">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title fs-4 text-center fw-bold">Crea tu cuenta de estudiante</h5>
                                <p class="card-text fs-6 text-center">
                                    Regístrate como estudiante para acceder a cientos de oportunidades de prácticas preprofesionales. 
                                    Podrás postular fácilmente a ofertas en empresas de distintos sectores y llevar el control de tus 
                                    postulaciones desde un solo lugar. ¡Empieza a construir tu futuro profesional hoy!
                                </p>
                                <div class="d-flex justify-content-center">
                                    <a href="<%= request.getContextPath()%>/paginas/crear_cuenta_alumno.jsp" class="btn btn-danger">
                                        Estudiante
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Empresa -->
                    <div class="col-sm-6">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title fs-4 text-center fw-bold">Crea tu cuenta de empresa</h5>
                                <p class="card-text fs-6 text-center">
                                    Registra tu empresa para publicar ofertas de prácticas preprofesionales y encontrar talento joven 
                                    con potencial. Gestiona postulaciones, filtra candidatos y conecta con estudiantes que buscan adquirir 
                                    experiencia en el mundo laboral. Encuentra hoy a tus próximos profesionales en formación.
                                </p>
                                <div class="d-flex justify-content-center">
                                    <a href="<%= request.getContextPath()%>/paginas/crear_cuenta_empresa.jsp" class="btn btn-danger">
                                        Empresa
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
