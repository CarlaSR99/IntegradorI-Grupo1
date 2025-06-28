/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DaoImpl.EmpresaDaoImpl;
import Model.Empresa;
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
@WebServlet(name = "PerfilEmpresaServlet", urlPatterns = {"/PerfilEmpresa"})
public class PerfilEmpresaServlet extends HttpServlet {

    EmpresaDaoImpl daoEmpresa = new EmpresaDaoImpl();

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

        
        Empresa empresa = daoEmpresa.obtenerPorUsuarioId(usuarioId);
        
        request.setAttribute("empresa", empresa);
        request.getRequestDispatcher("/paginas/perfil-empresa.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

  

}
