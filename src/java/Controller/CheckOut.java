/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Customer;
import Model.OrderDetail;
import dal.CustomerDAO;
import dal.ItemDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Map;

/**
 *
 * @author kiennn
 */
public class CheckOut extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOut</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOut at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, Model.Cart> carts = (Map<Integer, Model.Cart>) session.getAttribute("cart");
        ItemDAO idao = new ItemDAO();
        double totalPrice = 0;
        for (Model.Cart cart : carts.values()) {
            if (cart.getQuantity() > idao.getItemByIID(cart.getItem().getId()).getQuantity()) {
                request.getRequestDispatcher("Cart.jsp").forward(request, response);
                return;
            } else {
                idao.updateItemQuantity(cart.getItem().getId(), cart.getQuantity());
            }
            totalPrice += cart.getQuantity() * cart.getItem().getCost();
        }

        Account a = (Account) session.getAttribute("user");
        CustomerDAO cdao = new CustomerDAO();
        Customer c = cdao.getCustomerByUsername(a.getUsername());
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.addOrder(c.getId(), totalPrice, false);
        OrderDetailDAO oddao = new OrderDetailDAO();
        for (Model.Cart cart : carts.values()) {
            OrderDetail orderDetail = new OrderDetail(cart.getItem().getId(), cart.getQuantity(), orderId, cart.getItem().getCost());
            oddao.addOrderDetail(orderDetail);
        }

        session.removeAttribute("cart");
        session.removeAttribute("size");
        request.setAttribute("carts", carts);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("Thank.jsp").forward(request, response);
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
