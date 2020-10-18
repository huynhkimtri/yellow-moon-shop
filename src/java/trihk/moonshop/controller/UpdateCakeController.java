/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import trihk.moonshop.entity.Users;

/**
 *
 * @author TriHuynh
 */
@WebServlet(name = "UpdateCakeController", urlPatterns = {"/UpdateCakeController"})
public class UpdateCakeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("id");
            int cakeId = Integer.parseInt(id.trim());
            String name = request.getParameter("udtName");
            String imageUrl = request.getParameter("udtImageUrl").trim();
            String price = request.getParameter("udtPrice").trim();
            String quantity = request.getParameter("udtQuantity").trim();
            String createDate = request.getParameter("udtCreateDate").trim();
            String expirationDate = request.getParameter("udtExpDate").trim();
            String category = request.getParameter("udtCategory");
            String status = request.getParameter("udtStatus");
            System.out.println(imageUrl.length());
            System.out.println(name);
//            System.out.println(id + name + imageUrl + price + quantity + createDate + expirationDate + category + status);
            Users user = (Users) request.getSession().getAttribute("USER");
//            CakeService service = new CakeService();
//            Cakes newCake = service.updateCake(cakeId, name,
//                    true, createDate, expirationDate,
//                    0, 0, 0, status);
        } catch (NumberFormatException e) {
            // TODO
        }
        response.sendRedirect("dashboard");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
