/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Base;
import Model.Customer;
import Model.Employee;
import dal.BaseDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiennn
 */
@WebServlet(name="searchEmployee", urlPatterns={"/searchemployee"})
public class searchEmployee extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchEmployee</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchEmployee at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String keyword= request.getParameter("keyword");
        EmployeeDAO dao = new EmployeeDAO();
        BaseDAO baseDao = new BaseDAO();

        List<Base> listBase = baseDao.getAll();
        List<Employee> searchResult = dao.getAllEm();
        List<Employee> result = new ArrayList<>();
        try {
            
            if (keyword != null && !keyword.trim().isEmpty() && !keyword.endsWith("@gmail.com")) {
                
                for (Employee employee : searchResult) {
                    if(employee.getUsername().contains(keyword)){
                        result.add(employee);
                    }
                }
            }
            request.setAttribute("listEm", result);
            request.setAttribute("listBase", listBase);
            request.getRequestDispatcher("EmployeeManagement.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
        
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
