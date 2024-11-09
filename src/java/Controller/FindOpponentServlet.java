/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Customer;
import Model.MatchQueue;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
@WebServlet(name = "FindOpponentServlet", urlPatterns = {"/FindOpponentServlet"})
public class FindOpponentServlet extends HttpServlet {

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
            out.println("<title>Servlet FindOpponentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FindOpponentServlet at " + request.getContextPath() + "</h1>");
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
//        String num_str = request.getParameter("num");
//        String jsp = request.getParameter("jsp");
//        int num = Integer.parseInt(num_str);
//        CustomerDAO cd = new CustomerDAO();
//        HttpSession session = request.getSession();
//        Account a = (Account) session.getAttribute("user");
//        Customer c = cd.getCustomerByUsername(a.getUsername());
//        if (cd.findOpponent(c, num).isEmpty()) {
//            request.setAttribute("msg", "Cannot find opponent!!!");
//            if (jsp.equalsIgnoreCase("1vs1")) {
//                request.getRequestDispatcher("FindOpponent_1vs1.jsp").forward(request, response);
//            } else {
//                request.getRequestDispatcher("FindOpponent_2vs2.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("opponent", cd.findOpponent(c, num));
//            
//            response.setContentType("text/plain");
//
//            if (cd.findOpponent(c, num) != null && !cd.findOpponent(c, num).isEmpty()) {
//                response.getWriter().write(cd.findOpponent(c, num).get(0).getFullName());  // Send the first opponent's name
//            } else {
//                response.getWriter().write("");  // Send an empty response if no opponent found
//            }
//            
//            if (jsp.equalsIgnoreCase("1vs1")) {
//                request.getRequestDispatcher("FindOpponent_1vs1.jsp").forward(request, response);
//            } else {
//                request.getRequestDispatcher("FindOpponent_2vs2.jsp").forward(request, response);
//            }
//        }
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
        Account a = (Account) request.getSession().getAttribute("user");
        CustomerDAO cd = new CustomerDAO();
        MatchQueue.addUser(cd.getCustomerByUsernameRank(a.getUsername()).getId());
        MatchQueue.matchUsers();
        
        response.setContentType("application/json");

        Integer opponentId = MatchQueue.getOpponent(cd.getCustomerByUsernameRank(a.getUsername()).getId());
        
        if (opponentId != null) {
            String opponentName = cd.getCustomerByIdRank(opponentId).getUsername(); // Lấy tên đối thủ
            response.getWriter().write("{\"player2\":\"" + opponentName + "\"}");
        } else {
            response.getWriter().write("{\"player2\":null}"); // Không có đối thủ
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
