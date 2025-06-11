/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DaoImpl.PuestoDaoImpl;
import Model.oferta_practica;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author adria
 */
@WebServlet(name = "PuestosServlet", urlPatterns = {"/Puestos"})
public class PuestosServlet extends HttpServlet {

    PuestoDaoImpl dao = new PuestoDaoImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_empresa = Integer.parseInt(request.getParameter("id_empresa"));

        List<oferta_practica> puestos = dao.listar(id_empresa);

        request.setAttribute("puestos", puestos);

        RequestDispatcher disparador = request.getRequestDispatcher("vistas/puestos.jsp");

        disparador.forward(request, response);
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
