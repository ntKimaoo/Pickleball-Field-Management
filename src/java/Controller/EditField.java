/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Field;
import dal.BaseDAO;
import dal.FieldDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thang
 */
@WebServlet(name="EditField", urlPatterns={"/editfield"})
public class EditField extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditField</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditField at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id=request.getParameter("id");
        FieldDAO fdao=new FieldDAO();
        BaseDAO bdao=new BaseDAO();
        request.setAttribute("listbase", bdao.getAll());
        request.setAttribute("field",fdao.getFieldById(Integer.parseInt(id)));
        request.getRequestDispatcher("editfield.jsp").forward(request, response);
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
        FieldDAO fdao=new FieldDAO();
        int id=Integer.parseInt(request.getParameter("id"));
        String base=request.getParameter("base");
        String cost=request.getParameter("cost");
        String vip=request.getParameter("vip");
        String status=request.getParameter("status");
        String image=request.getParameter("image");
        boolean realvip=true;
        if (vip==null||vip.equals("")) realvip=false;
        Field f=new Field(id, Integer.parseInt(cost), status, realvip, base, image);
        fdao.updateField(f);
        response.sendRedirect("fieldmanagement");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
