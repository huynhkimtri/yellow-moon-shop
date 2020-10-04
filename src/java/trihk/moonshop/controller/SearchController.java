/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jdt.internal.compiler.impl.Constant;
import trihk.moonshop.entity.Cakes;
import trihk.moonshop.entity.Categories;
import trihk.moonshop.helper.Constants;
import trihk.moonshop.service.CakeService;

/**
 *
 * @author TriHuynh
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

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
        String path = "home.jsp";
        try {
            String keyword = request.getParameter("keyword");
            String min = request.getParameter("min");
            String max = request.getParameter("max");
            String category = request.getParameter("category");
            int minPrice = Integer.parseInt(min.trim());
            int maxPrice = Integer.parseInt(max.trim());
            int categoryId = Integer.parseInt(category.trim());
            CakeService service = new CakeService();
            List<Cakes> listCakes
                    = service.getListAll(keyword, minPrice, maxPrice,
                            categoryId, Constants.SIZE_OF_PAGE, 1);
            System.out.println(listCakes);
            request.setAttribute("LIST_CAKES", listCakes);
            List<Categories> listCategories = service.getListCategories();
            request.setAttribute("LIST_CATEGORIES", listCategories);
        } catch (NumberFormatException e) {
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
