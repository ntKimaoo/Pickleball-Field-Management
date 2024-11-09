/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.CategoryDAO;
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
public class UpdateItemServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateItemServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateItemServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ItemDAO iDao = new ItemDAO();
        CategoryDAO cDao = new CategoryDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("update", iDao.getItemByIID(id));
        request.setAttribute("categoryList", cDao.getAllCategory());
        request.getRequestDispatcher("UpdateItem.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ItemDAO idao = new ItemDAO();
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float cost = Float.parseFloat(request.getParameter("cost"));
        int cid = Integer.parseInt(request.getParameter("category"));
        int id = Integer.parseInt(request.getParameter("id"));
        idao.UpdateItem(name, description, image, quantity, cost, cid,id);
        response.sendRedirect("itemmanager");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
