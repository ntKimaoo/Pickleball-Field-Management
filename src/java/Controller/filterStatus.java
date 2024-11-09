/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Customer;
import dal.CustomerDAO;
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
public class filterStatus extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet filterStatus</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterStatus at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String filterStatus=request.getParameter("status");
        String statusBool=null;
        if(filterStatus.equals("active")){
            statusBool="1";
        }else if(filterStatus.equals("inactive")){
            statusBool="0";
        }else{
            statusBool="allstatus";
        }
        CustomerDAO dao = new CustomerDAO();
        
        String getIndex = request.getParameter("index");
        int index;
        int countotalUser=dao.getAllTotalUserByStatus(statusBool);
        if(request.getParameter("index")==null){
            index=1;
        }
        else{
            index=Integer.parseInt(getIndex);
        }
        int endPage=(countotalUser/6);
        if(countotalUser%6!=0){
            endPage++;
        }
        
        List<Customer> listUser = dao.filterStatus(statusBool,index);
        request.setAttribute("listUser", listUser);
        request.setAttribute("endP", endPage);
        request.setAttribute("pageIndex", index);
        
        request.setAttribute("listUser", listUser);
        request.setAttribute("filterStatus", filterStatus);
        request.getRequestDispatcher("UserManagement.jsp").forward(request, response);
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
