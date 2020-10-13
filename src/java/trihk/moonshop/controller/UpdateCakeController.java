/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import javax.servlet.RequestDispatcher;
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
        response.setContentType("text/html;charset=UTF-8");
//         name, image, price, category, quantity, createDate, expirationDate, status..
        try {
            String id = request.getParameter("id");
            int cakeId = Integer.parseInt(id);
            String txtName = request.getParameter("txtName");
            String txtImageUrl = request.getParameter("txtImageUrl");
            String txtPrice = request.getParameter("txtPrice");
            String txtQuantity = request.getParameter("txtQuantity");
            String dtmCreateDate = request.getParameter("dtmCreateDate");
            String dtmExpirationDate = request.getParameter("dtmExpirationDate");
            String cbxCategory = request.getParameter("cbxCategory");
            String cbxStatus = request.getParameter("cbxStatus");
            Users user = (Users) request.getSession().getAttribute("USER");
            CakeService service = new CakeService();
            Cakes newCake = service.updateCake(cakeId, txtName, dtmCreateDate,
                    true, dtmCreateDate, dtmExpirationDate,
                    0, 0, 0, cbxStatus);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home");
            dispatcher.forward(request, response);
        } catch (IOException | ServletException e) {
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
