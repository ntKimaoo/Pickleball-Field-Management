/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

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
@WebServlet(name="FieldBooking", urlPatterns={"/fieldbooking"})
public class FieldBooking extends HttpServlet {
   
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
            out.println("<title>Servlet FieldBooking</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FieldBooking at " + request.getContextPath () + "</h1>");
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
        BaseDAO bdao=new BaseDAO();
        FieldDAO fdao=new FieldDAO();
        String date=request.getParameter("date");
        String time=request.getParameter("time");
        String base=request.getParameter("base");
        String field=request.getParameter("field");
        if(date!=null&&time!=null &&base==null){
            request.setAttribute("date", date);
            request.setAttribute("time", time);
            request.setAttribute("baselist", bdao.getAll());
            request.getRequestDispatcher("FieldBooking.jsp").forward(request, response);
        }else if(date!=null&&base!=null&&field==null){
            request.setAttribute("date", date);
            request.setAttribute("time", time);
            request.setAttribute("baselist", bdao.getAll());
            request.setAttribute("base", base);
            request.setAttribute("fieldlist", fdao.getAllByBase(Integer.parseInt(base)));
            request.getRequestDispatcher("FieldBooking.jsp").forward(request, response);
        }
        else if(date!=null&&time!=null&&field!=null){
            request.setAttribute("date", date);
            request.setAttribute("time", time);
            request.setAttribute("baselist", bdao.getAll());
            request.setAttribute("base", base);
            request.setAttribute("fieldlist", fdao.getAllByBase(Integer.parseInt(base)));
            request.setAttribute("field", field);
            request.getRequestDispatcher("FieldBooking.jsp").forward(request, response);
        }
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
