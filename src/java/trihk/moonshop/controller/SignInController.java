/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trihk.moonshop.entity.Users;
import trihk.moonshop.helper.Constants;
import trihk.moonshop.service.UserService;

/**
 *
 * @author TriHuynh
 */
@WebServlet(name = "SignInController", urlPatterns = {"/SignInController"})
public class SignInController extends HttpServlet {
    
    private final String signInPage = "signin.jsp";
    private static final Logger LOG = Logger.getLogger(SignInController.class.getName());

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
        String msgError = "MSG_ERROR";
        String path = signInPage;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            UserService service = new UserService();
            Users user = service.signIn(username, password);
            if (user != null) {
                if (user.getIsActive()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USER", user);
                    path = "home";
                } else {
                    request.setAttribute(msgError, Constants.MSG_INACTIVE);
                }
            } else {
                request.setAttribute("LASTED_USERNAME", username);
                request.setAttribute(msgError, Constants.MSG_INCORRECT);
            }
            if (path.equals(signInPage)) {
                RequestDispatcher dispatcher = request.getRequestDispatcher(path);
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect(path);
            }
        } catch (IOException | ServletException e) {
            request.setAttribute(msgError, Constants.MSG_SERVER_FAIL);
            LOG.log(Level.SEVERE, e.getMessage());
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
