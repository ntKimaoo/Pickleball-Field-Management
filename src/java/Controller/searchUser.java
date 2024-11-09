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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class searchUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        boolean isNumeric = keyword != null && keyword.matches("\\d+");
        CustomerDAO dao = new CustomerDAO();
        List<Customer> searchResult = dao.getAllUser();
        List<Customer> result = new ArrayList<>();
        try {
            //id
            if (isNumeric && Integer.parseInt(keyword)<dao.getMaxID() && !keyword.substring(0, 1).equals("0")) {
                int id = Integer.parseInt(keyword);
                for (Customer customer : searchResult) {
                    if(customer.getId()==Integer.parseInt(keyword)){
                        result.add(customer);
                    }
                }
            }else if(isNumeric && keyword.substring(0, 1).equals("0") && keyword.length()==10){
                for (Customer customer : searchResult) {
                    if(customer.getPhone().equals(keyword)){
                        result.add(customer);
                    }
                }
            }
            else if (keyword != null && !keyword.trim().isEmpty() && !keyword.endsWith("@gmail.com")) {//username
                for (Customer customer : searchResult) {
                    if(customer.getUsername().contains(keyword)){
                        result.add(customer);
                    }
                }
            } else if(keyword != null && !keyword.trim().isEmpty() && keyword.endsWith("@gmail.com")){//gmail
                for (Customer customer : searchResult) {
                    if(customer.getEmail().contains(keyword)){
                        result.add(customer);
                    }
                }
            }
            request.setAttribute("listUser", result);
            request.getRequestDispatcher("UserManagement.jsp").forward(request, response);
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
