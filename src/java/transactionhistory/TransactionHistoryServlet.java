/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package transactionhistory;

import Model.Account;
import Model.Customer;
import Model.TransactionHistory;
import dal.AccountDAO;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TuấnAnh Hà
 */
@WebServlet(name = "TransactionHistoryServlet", urlPatterns = {"/transactionhistory"})
public class TransactionHistoryServlet extends HttpServlet {

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
         String index = request.getParameter("index");
        if(index == null) {
        	index="1";
        }

        int indexPage = Integer.parseInt(index);
        CustomerDAO cDao = new CustomerDAO();
        AccountDAO aDao = new AccountDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        Customer cAcc = cDao.getCustomerByUsername(acc.getUsername());
        List<TransactionHistory> listTrHis = cDao.getAllHistory(cAcc.getId());
    
        request.setAttribute("listH", listTrHis);
        request.getRequestDispatcher("TransactionHistory.jsp").forward(request, response);
         
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
        processRequest(request, response);
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
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String type = request.getParameter("type");
        try{
        Date fromD = (fromDate == null || fromDate.equals("")) ? null
                : Date.valueOf(fromDate); // Thêm giờ bắt đầu
        Date toD = (toDate == null || toDate.equals("")) ? null
                : Date.valueOf(toDate);

        CustomerDAO cDao = new CustomerDAO();
        AccountDAO aDao = new AccountDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        Customer cAcc = cDao.getCustomerByUsername(acc.getUsername());
        List<TransactionHistory> listTrHis = cDao.getHistory(cAcc.getId(), fromD, toD, type);
        request.setAttribute("type", type);
        request.setAttribute("listH", listTrHis);
        request.getRequestDispatcher("TransactionHistory.jsp").forward(request, response);
         } catch (Exception e) {
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
