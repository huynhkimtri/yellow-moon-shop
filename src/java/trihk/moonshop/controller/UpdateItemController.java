/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trihk.moonshop.bean.CartBean;
import trihk.moonshop.entity.Cakes;
import trihk.moonshop.helper.Constants;
import trihk.moonshop.service.CakeService;
import trihk.moonshop.service.CartService;

/**
 *
 * @author TriHuynh
 */
@WebServlet(name = "UpdateItemController", urlPatterns = {"/UpdateItemController"})
public class UpdateItemController extends HttpServlet {

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
        String path = "myCart.jsp";
        try {
            String id = request.getParameter("cakeId");
            int cakeId = Integer.parseInt(id);
            String quan = request.getParameter("quantity");
            int quantity = Integer.parseInt(quan);
            CartBean cart = (CartBean) request.getSession().getAttribute("MY_CART");
            CartService sCart = new CartService();
            CakeService cakeService = new CakeService();
            Cakes cake = cakeService.getOne(cakeId);
            if (cake.getQuantity() >= quantity) {
                cart = sCart.updateItemFromCart(cakeId, cart, quantity);
                HttpSession session = request.getSession();
                session.setAttribute("MY_CART", cart);
            } else {
                request.setAttribute("MSG", "There are not enough cake: \"<b>" 
                        + cake.getName() + "</b>\" in stock, try again with another quantity");
            }
        } catch (NumberFormatException e) {
            // TODO
        } finally {
            RequestDispatcher dispatcher = request.getRequestDispatcher(path);
            dispatcher.forward(request, response);
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
