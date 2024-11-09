/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package getitems;

import Model.Account;
import Model.Bag;
import Model.Customer;
import Model.Orders;
import Model.OrdersDetail;
import Model.Product;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TuấnAnh Hà
 */
@WebServlet(name = "OrderDetailControl", urlPatterns = {"/orderdetail"})
public class OrderDetailControl extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        int orderId = Integer.parseInt(request.getParameter("id"));
        CustomerDAO cDao = new CustomerDAO();

        
        List<OrdersDetail> orderDetails = cDao.loadOrderDetailByOrderId(orderId);
        List<Product> listP=new ArrayList<>();
        int TotalAmount=0;
        for (OrdersDetail c : orderDetails) {
            Product a=cDao.getProductByID(c.getProductid());
            TotalAmount+=c.getQuantity()*a.getPrice();
            listP.add(new Product(a.getId(), 
                    a.getName(), 
                    a.getImage(), 
                    a.getPrice(), 
                    a.getMemberid(),
                    c.getQuantity()));
        }
        
        Orders order = cDao.getOrderById(orderId);
       int customerid = order.getCustomerid();
       Customer cAcc = cDao.getCustomerById(customerid);
         int totalMoney=TotalAmount;
        request.setAttribute("list", listP);
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("totalAmount", TotalAmount);
        request.setAttribute("order", order);
        request.setAttribute("user", cAcc);
        request.getRequestDispatcher("order-details.jsp").forward(request, response);

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
        processRequest(request, response);
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
