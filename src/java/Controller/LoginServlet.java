/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MD5Encryptor;

/**
 *
 * @author pc
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passw = "";
        try {
            passw = MD5Encryptor.usingMd5(password);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        AccountDAO adao = new AccountDAO();
        EmployeeDAO emDao = new EmployeeDAO();
        HttpSession session = request.getSession();
        if (adao.getAccountByUsername(username) == null) {
            request.setAttribute("error", "Account doest not exist!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if (!adao.getAccountByUsername(username).getPassword().equals(password)) {
            request.setAttribute("error", "Wrong password!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if (adao.getAccountByUsername(username).getRole().equals("Employee")) {
            if (!adao.getAccountByUsername(username).isIsActived()) {
                session.setAttribute("user", adao.getAccountByUsername(username));
                request.setAttribute("error", "You need to change your password");
                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            } else {
                session.setAttribute("loggedinuser", username);
                session.setAttribute("user", adao.getAccountByUsername(username));
                adao.online(adao.getAccountByUsername(username));
                System.out.println("login succes");
                if (adao.getAccountByUsername(username).getRole().toLowerCase().equals("admin")) {
                    response.sendRedirect("dashboard");
                } else {
                    response.sendRedirect("home");
                }
            }
        } else {
            session.setAttribute("loggedinuser", username);
            session.setAttribute("user", adao.getAccountByUsername(username));
            adao.online(adao.getAccountByUsername(username));
            System.out.println("login succes");
            if (adao.getAccountByUsername(username).getRole().toLowerCase().equals("admin")) {
                response.sendRedirect("dashboard");
            } else {
                response.sendRedirect("home");
            }
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
