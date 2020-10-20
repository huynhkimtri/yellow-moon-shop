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
import trihk.moonshop.entity.Cakes;
import trihk.moonshop.entity.Users;
import trihk.moonshop.service.CakeService;

/**
 *
 * @author TriHuynh
 */
@WebServlet(name = "CreateCakeController", urlPatterns = {"/CreateCakeController"})
public class CreateCakeController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String name = request.getParameter("name");
            String des = request.getParameter("description");
            String imageUrl = request.getParameter("imageUrl");
            String sPrice = request.getParameter("price");
            int price = Integer.parseInt(sPrice.trim());
            String sQuantity = request.getParameter("quantity");
            int quantity = Integer.parseInt(sQuantity.trim());
            String sCategory = request.getParameter("category");
            int categoryId = Integer.parseInt(sCategory.trim());
            String createDate = request.getParameter("createDate");
            String expDate = request.getParameter("expDate");

            Users user = (Users) request.getSession().getAttribute("USER");

            CakeService service = new CakeService();
            Cakes cake = service.insert(name, des, imageUrl, price, categoryId,
                    quantity, createDate, expDate, user);

            if (cake != null) {
                response.sendRedirect("dashboard");
            } else {
                request.getRequestDispatcher("newCake").forward(request, response);
            }
        } catch (IOException e) {
            e.printStackTrace();
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
