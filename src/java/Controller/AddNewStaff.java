/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Account;
import Model.Email;
import Model.Employee;
import dal.AccountDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class AddNewStaff extends HttpServlet {
    private static final String UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWERCASE = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";

    private static final String ALL_CHARACTERS = UPPERCASE + LOWERCASE + DIGITS;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddNewStaff</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewStaff at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        request.getRequestDispatcher("AddNewStaff.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = generateRandomPassword(10);
        String email = request.getParameter("email");
        String base = request.getParameter("base");
        AccountDAO acdao = new AccountDAO();
        EmployeeDAO emdao = new EmployeeDAO();
        acdao.insertAccount(new Account(username, password, "Employee", LocalDate.now().toString(), false, false));
        emdao.insertStaff(new Employee(fullname, email, null, null, Integer.parseInt(base)), username);
        Email e=new Email();
        e.sendAccountStaff(acdao.getAccountByUsername(username), emdao.getStaffByUsername(username));
        request.getRequestDispatcher("employeemanagement").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    public static String generateRandomPassword(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(ALL_CHARACTERS.length());
            password.append(ALL_CHARACTERS.charAt(index));
        }

        return password.toString();
    }
}
