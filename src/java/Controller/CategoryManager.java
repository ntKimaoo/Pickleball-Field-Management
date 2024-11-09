/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Category;
import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class CategoryManager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CategoryManager</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryManager at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cDao = new CategoryDAO();
        String id = request.getParameter("cid");
        String statusParam = request.getParameter("status");
        if (statusParam != null) {
            boolean status = Boolean.parseBoolean(statusParam);
            cDao.updateCategoryStatus(id, !status);
        }
        String categoryStatus = request.getParameter("categoryStatus");
        List<Category> listCategory;

        if (categoryStatus != null && !categoryStatus.isEmpty()) {
            boolean istatus = Boolean.parseBoolean(categoryStatus);
            listCategory = cDao.getStatusCategory(istatus);
            request.setAttribute("categoryList", listCategory);
        } else {
            int pageSize = 8;
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            listCategory = cDao.getPaging(page, pageSize);
            int totalItem = cDao.getNumberPageItem();
            int totalPage = totalItem / pageSize;
            if (totalItem % pageSize != 0) {
                totalPage += 1;
            }
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
        }
        request.setAttribute("categoryList", listCategory);
        request.getRequestDispatcher("CategoryManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
