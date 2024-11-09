/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Cart;
import dal.ItemDAO;
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
public class AddToCart extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            //map    productId | cart
            HttpSession session = request.getSession();
            //lay lai data cu ma b da add len cart 
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("cart");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            if (carts.containsKey(itemId)) {//sản phẩm đã có trên giỏ hàng
                int oldQuantity = carts.get(itemId).getQuantity();
                carts.get(itemId).setQuantity(oldQuantity + 1);
            } else {//sản phẩm chưa có trên giỏ hàng
                ItemDAO idao = new ItemDAO();
                carts.put(itemId, new Cart(idao.getItemByIID(itemId), 1));
            }
            //lưu carts lên session
            session.setAttribute("cart", carts);
            session.setAttribute("size", carts.size());
            String urlHistory = (String) session.getAttribute("urlHistory");
            if (urlHistory == null) {
                urlHistory = "shop";
            }
            response.sendRedirect(urlHistory);
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
