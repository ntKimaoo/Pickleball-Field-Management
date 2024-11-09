/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Customer;
import Model.Employee;
import dal.AccountDAO;
import dal.CustomerDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thang
 */
public class ChangePassword extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        AccountDAO adao = new AccountDAO();
        CustomerDAO cdao = new CustomerDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        Customer c = cdao.getCustomerByUsername(a.getUsername());
        request.setAttribute("profile", cdao.getCustomerByUsername(a.getUsername()));
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
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
        AccountDAO adao = new AccountDAO();
        CustomerDAO cdao = new CustomerDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        Customer c = cdao.getCustomerByUsername(a.getUsername());
        Employee e = new EmployeeDAO().getStaffByUsername(a.getUsername());
        request.setAttribute("profile", cdao.getCustomerByUsername(a.getUsername()));
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        String repassword = request.getParameter("repassword");
        if (!password.equals(a.getPassword())) {
            request.setAttribute("error", "Old password wrong, change password unsuccessfully!");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        }
        if (!repassword.equals(newpassword)) {
            request.setAttribute("error", "Repassword wrong, change password unsuccessfully!");
            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
        } else {
            if(e.isIsActived()==false){
                EmployeeDAO dao = new EmployeeDAO();
                dao.activeAccStaff(e.getId());
            }
            a.setPassword(newpassword);
            adao.update(a);
            response.sendRedirect("logout");
        }
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