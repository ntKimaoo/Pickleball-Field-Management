/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author kiennn
 */
public class Cart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Map<Integer, Model.Cart> carts = (Map<Integer, Model.Cart>) session.getAttribute("cart");
            if(carts==null){
                carts = new LinkedHashMap<>();
            }
            
            double totalPrice = 0;
            for (Map.Entry<Integer, Model.Cart> entry : carts.entrySet()) {
                Integer itemId = entry.getKey();
                Model.Cart cart = entry.getValue();                
                totalPrice += cart.getQuantity() * cart.getItem().getCost();
                
            }
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("cart", carts);
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
