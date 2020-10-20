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
import trihk.moonshop.service.CakeService;

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
        String path = "dashboard";
        try {
            String queryString = request.getParameter("queryString");
            
            String id = request.getParameter("id");
            int cakeId = Integer.parseInt(id.trim());
            String name = request.getParameter("udtName");
            String imageUrl = request.getParameter("udtImageUrl").trim();
            String sPrice = request.getParameter("udtPrice");
            int price = Integer.parseInt(sPrice.trim());
            String sCategory = request.getParameter("udtCategory");
            int categoryId = Integer.parseInt(sCategory.trim());
            String sQuantity = request.getParameter("udtQuantity").trim();
            int quantity = Integer.parseInt(sQuantity);
            String sCreateDate = request.getParameter("udtCreateDate");
            String sExpDate = request.getParameter("udtExpDate");
            String sStatus = request.getParameter("udtStatus");
            boolean status = true;
            
            if (!"true".equalsIgnoreCase(sStatus)) {
                status = false;
            }
            
            Users user = (Users) request.getSession().getAttribute("USER");
            
            CakeService service = new CakeService();
            service.updateCake(cakeId, name, imageUrl, price,
                    categoryId, quantity, sCreateDate, sExpDate, status, user);
            
            if (queryString != null) {
                path = path + "?" + queryString;
            }
            
            response.sendRedirect(path);
        } catch (NumberFormatException e) {
            // TODO
        }
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
