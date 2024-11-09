/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package getitems;

import Model.Account;
import Model.Customer;
import Model.Orders;
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
import java.sql.Date;
import java.util.List;

/**
 *
 * @author TuấnAnh Hà
 */
@WebServlet(name = "OrderAdmin", urlPatterns = {"/order-list"})
public class OrderAdmin extends HttpServlet {

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
        String action = request.getParameter("action");

        String orderID = request.getParameter("id");

        CustomerDAO cDao = new CustomerDAO();

        if (action != null) {
            if (action.equals("payment")) {
                cDao.updatePayment(Integer.parseInt(orderID));
                response.sendRedirect("order-list");
            }
        }
            List<Orders> orders = cDao.getAllOrders();
            request.setAttribute("orders", orders);
            //response.sendRedirect("home");
            request.getRequestDispatcher("ListOrderAdmin.jsp").forward(request, response);
        
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
       
        try{
        Date fromD = (fromDate == null || fromDate.equals("")) ? null
                : Date.valueOf(fromDate); // Thêm giờ bắt đầu
        Date toD = (toDate == null || toDate.equals("")) ? null
                : Date.valueOf(toDate);

        CustomerDAO cDao = new CustomerDAO();
        AccountDAO aDao = new AccountDAO();
         List<Orders> orders = cDao.getOrderByDate(fromD, toD);
            request.setAttribute("orders", orders);
          
            request.getRequestDispatcher("ListOrderAdmin.jsp").forward(request, response);
        
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
