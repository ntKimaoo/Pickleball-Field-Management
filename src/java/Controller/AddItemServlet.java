/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.ItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author kiennn
 */
public class AddItemServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddItemServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddItemServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float cost = Float.parseFloat(request.getParameter("cost"));
        
        String statusParam = request.getParameter("status");
        boolean status = false;
        if (statusParam != null) {
            status = Boolean.parseBoolean(statusParam);
        }
        int cid = Integer.parseInt(request.getParameter("category"));
        ItemDAO iDao = new ItemDAO();
        iDao.addItem(name, description, image, quantity, cost, status, cid);
        response.sendRedirect("itemmanager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
