    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DaoImpl.AlumnoDaoImpl;
import DaoImpl.CredencialesUsuarioDaoImpl;
import DaoImpl.EmpresaDaoImpl;
import DaoImpl.UsuarioDaoImpl;
import Model.Alumno;
import Model.Empresa;
import Model.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author adria
 */
@WebServlet(name = "RegistrarUsuarioServlet", urlPatterns = {"/RegistrarUsuario"})

public class RegistrarUsuarioServlet extends HttpServlet {

    UsuarioDaoImpl usuaroImpl = new UsuarioDaoImpl();
    CredencialesUsuarioDaoImpl credencialesImpl = new CredencialesUsuarioDaoImpl();
    EmpresaDaoImpl empresaDAO = new EmpresaDaoImpl();
    AlumnoDaoImpl alumnoImp = new AlumnoDaoImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        String ConfirmarContrasena = request.getParameter("confirmarContrasena");

        if ("crearCuentaEmpresa".equals(accion)) {
            String nombre_emp = request.getParameter("nombre_emp");
            String razon_social = request.getParameter("razonSocial");
            String descripcion_emp = request.getParameter("descripcion");
            String direccion = request.getParameter("ubicacion");
            String sector = request.getParameter("sector");
            String ruc_emp = request.getParameter("ruc");

            Usuario usuario = new Usuario();
            usuario.setEmail(email);
            usuario.setRol("empresa");

            if (empresaDAO.rucExiste(ruc_emp)) {
                request.setAttribute("error", "Ya se encuentra registrado un RUC.");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }

            if (ruc_emp.length() != 11) {
                request.setAttribute("error", "El RUC debe tener 11 dígitos");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }

            if (ruc_emp.matches("[0-9]+") == false) {
                request.setAttribute("error", "El RUC solo debe contener números");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;  
            }

            if (nombre_emp == null || nombre_emp.isEmpty() || razon_social == null || razon_social.isEmpty() || descripcion_emp == null || descripcion_emp.isEmpty() || direccion == null || direccion.isEmpty() || sector == null || sector.isEmpty() || ruc_emp == null || ruc_emp.isEmpty()) {
                request.setAttribute("error", "Todos los campos son obligatorios");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }

            if (empresaDAO.nombreEmpresaExiste(nombre_emp)) {
                request.setAttribute("error", "Ya se encuentra registrado el nombre de empresa.");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }


            if (!contrasena.equals(ConfirmarContrasena)) {
                request.setAttribute("error", "Las contraseñas no coinciden");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }

            if (contrasena.length() < 8) {
                request.setAttribute("error", "La contraseña debe tener al menos 8 caracteres");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }

            if (usuaroImpl.existeEmail(email)) {
                request.setAttribute("error", "El correo ya está registrado");
                request.getRequestDispatcher("paginas/crear_cuenta_empresa.jsp").forward(request, response);
                return;
            }

            int idUsuario = usuaroImpl.Agrear(usuario);

            if (idUsuario != -1) {

                String hashed = BCrypt.hashpw(contrasena, BCrypt.gensalt());

                credencialesImpl.insertarCredencial(idUsuario, hashed);

                Empresa empresa = new Empresa();
                empresa.setNombre_emp(nombre_emp);
                empresa.setRuc_emp(ruc_emp);
                empresa.setDescripcion_emp(descripcion_emp);
                empresa.setUsuario_id(idUsuario);
                empresa.setDireccion(direccion);
                empresa.setRazon_social(razon_social);
                empresa.setSector(sector);

                boolean isertado = empresaDAO.insertar(empresa);

                if (isertado) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("rol", usuario.getRol());
                    sesion.setAttribute("idUsuario", idUsuario);
                    usuaroImpl.InsertarLogin(idUsuario);
                    response.sendRedirect(request.getContextPath() + "/PerfilEmpresa");

                } else {
                    credencialesImpl.Elminar(idUsuario);
                    usuaroImpl.Eliminar(idUsuario);
                    response.sendRedirect(request.getContextPath() + "/paginas/crear_cuenta_empresa.jsp");
                }
            }

        } else if ("crearCuentaAlumno".equals(accion)) {
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String carrera = request.getParameter("carrera");
            String ciclo = request.getParameter("ciclo");
            String universidad = request.getParameter("universidad");
            String telefono = request.getParameter("telefono");
            String fecha_nacimiento = request.getParameter("fecha_nacimiento");
            String genero = request.getParameter("genero");
            String ubicacion = request.getParameter("ubicacion");

            Usuario usuario = new Usuario();
            usuario.setEmail(email);
            usuario.setRol("estudiante");

            
            if (dni == null || dni.isEmpty() || nombre == null || nombre.isEmpty() || apellido == null || apellido.isEmpty() || carrera == null || carrera.isEmpty() || ciclo == null || ciclo.isEmpty() || universidad == null || universidad.isEmpty() || telefono == null || telefono.isEmpty() || fecha_nacimiento == null || fecha_nacimiento.isEmpty() || genero == null || genero.isEmpty() || ubicacion == null || ubicacion.isEmpty()) {
                request.setAttribute("error", "Todos los campos son obligatorios");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (dni.length() != 8) {
                request.setAttribute("error", "El DNI debe tener 8 dígitos");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (dni.matches("[0-9]+") == false) {
                request.setAttribute("error", "El DNI solo debe contener números");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;  
            }

            if (alumnoImp.dniExiste(dni)) {
                request.setAttribute("error", "El dni ya existe");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (nombre.length() < 3) {
                request.setAttribute("error", "El nombre debe tener al menos 3 caracteres");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (apellido.length() < 3) {
                request.setAttribute("error", "El apellido debe tener al menos 3 caracteres");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (telefono.length() < 9 || telefono.length() > 12) {
                request.setAttribute("error", "El teléfono debe tener entre 9 y 12 dígitos");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (telefono.matches("[0-9]+") == false) {
                request.setAttribute("error", "El teléfono solo debe contener números");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            
            if (!contrasena.equals(ConfirmarContrasena)) {
                request.setAttribute("error", "Las contraseñas no coinciden");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (contrasena.length() < 8) {
                request.setAttribute("error", "La contraseña debe tener al menos 8 caracteres");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            if (usuaroImpl.existeEmail(email)) {
                request.setAttribute("error", "El correo ya está registrado");
                request.getRequestDispatcher("paginas/crear_cuenta_alumno.jsp").forward(request, response);
                return;
            }

            int idUsuario = usuaroImpl.Agrear(usuario);

            if (idUsuario != -1) {
                Alumno alumno = new Alumno();
                alumno.setNombre(nombre);
                alumno.setCarrera(carrera);
                alumno.setCiclo(ciclo);
                alumno.setUsuario_id(idUsuario);
                alumno.setApellido(apellido);
                alumno.setDni(dni);
                alumno.setTelefono(telefono);
                alumno.setFecha_nacimiento(fecha_nacimiento);
                alumno.setUniversidad(universidad);
                alumno.setGenero(genero);
                alumno.setUbicacion(ubicacion);

                boolean agrego = alumnoImp.insertar(alumno);

                String contrasenaHash = BCrypt.hashpw(contrasena, BCrypt.gensalt());
                credencialesImpl.insertarCredencial(idUsuario, contrasenaHash);

                if (agrego) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("rol", usuario.getRol());
                    sesion.setAttribute("idUsuario", idUsuario);
                    usuaroImpl.InsertarLogin(idUsuario);
                    response.sendRedirect(request.getContextPath() + "/PerfilEstudiante");

                } else {
                    credencialesImpl.Elminar(idUsuario);
                    usuaroImpl.Eliminar(idUsuario);
                    response.sendRedirect(request.getContextPath() + "/paginas/crear_cuenta_alumno.jsp");
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
  
}
