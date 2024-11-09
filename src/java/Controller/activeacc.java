/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.CustomerDAO;
import dal.EmployeeDAO;
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
public class activeacc extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet activeacc</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet activeacc at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String idget=request.getParameter("id");
        String staffId=request.getParameter("staffId");
        CustomerDAO dao = new CustomerDAO();
        EmployeeDAO emDao = new EmployeeDAO();
        if(idget!=null){
            int id=Integer.parseInt(idget);
            dao.activeAcc(id);
            response.sendRedirect("usermanagement");
        }else if(staffId!=null){
            int idstaff=Integer.parseInt(staffId);
            emDao.activeAccStaff(idstaff);
            response.sendRedirect("employeemanagement");
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String idget=request.getParameter("id");
        int id=Integer.parseInt(idget);
        CustomerDAO dao = new CustomerDAO();
        if(idget!=null){
            dao.activeAcc(id);
        }
        response.sendRedirect("editacc?id="+id);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
