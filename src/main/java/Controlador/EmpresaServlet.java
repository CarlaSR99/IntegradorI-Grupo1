/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.util.List;

import DaoImpl.EmpresaDaoImpl;
import Model.Empresa;
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
@WebServlet(name = "EmpresaServlet", urlPatterns = { "/Empresa" })
public class EmpresaServlet extends HttpServlet {

    EmpresaDaoImpl empresaDAO = new EmpresaDaoImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
            return;
        }

        String rol = (String) session.getAttribute("rol");
        if (!"estudiante".equals(rol)) {
            response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
            return;
        }

        // Si pasa las validaciones, obtiene y muestra los datos
        List<Empresa> empresas = empresaDAO.listarEmpresas();
        request.setAttribute("empresas", empresas);
        request.getRequestDispatcher("/paginas/listar_empresas.jsp").forward(request, response);

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
