/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DaoImpl.AlumnoDaoImpl;
import Model.Alumno;
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
@WebServlet(name = "PerfilEstudianteServlet", urlPatterns = {"/PerfilEstudiante"})
public class PerfilEstudianteServlet extends HttpServlet {

    AlumnoDaoImpl daoAlumno = new AlumnoDaoImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);

        if (sesion == null || sesion.getAttribute("idUsuario") == null) {
            response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
            return;
        }

        int usuarioId = (int) sesion.getAttribute("idUsuario");

        Alumno alumno = daoAlumno.obtenerPorId(usuarioId);


        request.setAttribute("alumno", alumno);
        request.getRequestDispatcher("/paginas/perfil-alumno.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
}
