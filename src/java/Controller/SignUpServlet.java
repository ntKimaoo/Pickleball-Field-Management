/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.time.LocalDate;
import Model.Account;
import Model.Customer;
import Model.RankHistory;
import dal.AccountDAO;
import dal.CustomerDAO;
import dal.RankDAO;
import dal.RankHistoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MD5Encryptor;

/**
 *
 * @author pc
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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
        String re_pass = request.getParameter("repassword");
        String name = request.getParameter("fullname");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String term = request.getParameter("term");
        request.setAttribute("username", username);
        request.setAttribute("nickname", nickname);
        request.setAttribute("password", password);
        request.setAttribute("repassword", re_pass);
        request.setAttribute("fullname", name);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        if (!password.equals(re_pass)) {
            request.setAttribute("error", "Re-password not the same!");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        } else {
            if (term == null || term.equals("")) {
                request.setAttribute("error", "To sign up, you have to accept with our term of agreement!");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            } else {
                AccountDAO adao = new AccountDAO();
                CustomerDAO cdao = new CustomerDAO();
                if (adao.isExisted(username)) {
                    request.setAttribute("error", "Username was existed");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                } else if (cdao.isNickNameExisted(nickname)) {
                    request.setAttribute("error", "Nickname was existed! Please use another nickname.");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                } else {
                    String passw = "";
                    try {
                        passw = MD5Encryptor.usingMd5(password);
                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    adao.insertAccount(new Account(username, password, "customer", LocalDate.now().toString(), true, false));
                    cdao.insertCustomer(new Customer(name, email, phone, address, nickname, null), username);
                    RankHistoryDAO rhd = new RankHistoryDAO();
                    RankDAO rd = new RankDAO();
                    rhd.insertRankHistory(new RankHistory(rhd.getRankHistory().get(rhd.getRankHistory().size() - 1).getHistory_id() + 1, cdao.getCustomerByUsername(username), rd.getRankById(1), java.time.LocalDate.now().toString() + " " + java.time.LocalTime.now().toString()));
                    request.setAttribute("error", "Sign up successfully!Please Login.");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
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
