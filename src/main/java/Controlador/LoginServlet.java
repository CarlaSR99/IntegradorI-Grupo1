/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DaoImpl.CredencialesUsuarioDaoImpl;
import DaoImpl.UsuarioDaoImpl;
import Model.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author adria
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {
    
    CredencialesUsuarioDaoImpl daoCUsuario = new CredencialesUsuarioDaoImpl();

    UsuarioDaoImpl usuarioImpl = new UsuarioDaoImpl();
    CredencialesUsuarioDaoImpl credencialesImpl = new CredencialesUsuarioDaoImpl();

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

        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");

        Usuario usuario = daoCUsuario.validarLogin(email, contrasena);




        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("idUsuario", usuario.getUsuario_id());
            session.setAttribute("rol", usuario.getRol());

            if ("empresa".equals(usuario.getRol())) {
                usuarioImpl.InsertarLogin(usuario.getUsuario_id());
                response.sendRedirect(request.getContextPath() + "/PerfilEmpresa");
            } else if ("estudiante".equals(usuario.getRol())) {
                usuarioImpl.InsertarLogin(usuario.getUsuario_id());
                response.sendRedirect(request.getContextPath() + "/PerfilEstudiante");
            } else if ("admin".equals(usuario.getRol())) {
                response.sendRedirect(request.getContextPath() + "/PerfilAdmin");
            } else {
                request.setAttribute("error", "Rol de usuario no reconocido");
                request.getRequestDispatcher("paginas/iniciar_sesion.jsp").forward(request, response);
            }
              
        } else {
            request.setAttribute("error", "Correo o contraseña incorrectos");
            request.getRequestDispatcher("paginas/iniciar_sesion.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }  // </editor-fold>

}
