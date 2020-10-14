/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            String page = request.getParameter("page");
            int minPrice = Integer.parseInt(min.trim());
            int maxPrice = Integer.parseInt(max.trim());
            int categoryId;
            try {
                categoryId = Integer.parseInt(category.trim());
            } catch (NumberFormatException e) {
                categoryId = 0;
            }
            CakeService service = new CakeService();

            int size = service.countForSearch(keyword, minPrice, maxPrice,
                    categoryId, Boolean.TRUE);

            int numOfPages = size / Constants.SIZE_OF_PAGE;
            if (size % Constants.SIZE_OF_PAGE != 0) {
                numOfPages = size / Constants.SIZE_OF_PAGE + 1;
            }
            int pageIndex = 0;
            try {
                if (page != null) {
                    pageIndex = Integer.parseInt(page.trim()) - 1;
                }
            } catch (NumberFormatException e) {
                pageIndex = 0;
            }
            List<Cakes> listCakes
                    = service.getListAll(keyword, minPrice, maxPrice,
                            categoryId, Boolean.TRUE, Constants.SIZE_OF_PAGE, pageIndex);
            request.setAttribute("LIST_CAKES", listCakes);
            List<Categories> listCategories = service.getListCategories();
            request.setAttribute("LIST_CATEGORIES", listCategories);
            request.setAttribute("NUMBER_OF_PAGES", numOfPages);
            request.setAttribute("PAGE_INDEX", pageIndex);
            request.setAttribute("CURRENT_PAGE", pageIndex + 1);
            request.setAttribute("KEYWORD", keyword);
            request.setAttribute("MIN", minPrice);
            request.setAttribute("MAX", maxPrice);
            request.setAttribute("CATEGORY", categoryId);
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
