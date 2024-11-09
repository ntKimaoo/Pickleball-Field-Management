/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Order;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class OrderManager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderManager</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderManager at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO odao = new OrderDAO();
        String id = request.getParameter("sid");
        String statusParam = request.getParameter("changeStatus");
        if (statusParam != null) {
            boolean status = Boolean.parseBoolean(statusParam);
            odao.updateOrderStatus(id, !status);
        }
        String orderStatus = request.getParameter("orderStatus");
        String sortOrderTotal = request.getParameter("sortOrderTotal");

        List<Order> list;

        if (orderStatus != null && !orderStatus.isEmpty()){
            boolean isStatus = Boolean.parseBoolean(orderStatus);
            if ("desc".equalsIgnoreCase(sortOrderTotal)) {
                list = odao.getOrderStatusDESC(isStatus);
            } else if ("asc".equalsIgnoreCase(sortOrderTotal)) {
                list = odao.getOrderStatusASC(isStatus);
            } else {
                list = odao.getOrderStatus(isStatus);
            }
        } else if (sortOrderTotal != null && !sortOrderTotal.isEmpty()) {
            if ("desc".equalsIgnoreCase(sortOrderTotal)) {
                list = odao.getDateDESC();
            } else if ("asc".equalsIgnoreCase(sortOrderTotal)) {
                list = odao.getDateASC();
            } else{
                list = odao.getAllOrder();
            }
        } else {
            int pageSize = 8;
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            list = odao.getPaging(page, pageSize);
            int totalItem = odao.getNumberPageItem();
            int totalPage = totalItem / pageSize;
            if (totalItem % pageSize != 0) {
                totalPage += 1;
            }
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
        }
        request.setAttribute("order", list);
        request.getRequestDispatcher("OrderManager.jsp").forward(request, response);
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
