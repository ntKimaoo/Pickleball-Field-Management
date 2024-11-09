/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package getitems;

import Model.Account;
import Model.Bag;
import Model.Customer;
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
@WebServlet(name="LoadBagControl", urlPatterns={"/bag"})
public class LoadBagControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        CustomerDAO cDao = new CustomerDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        Customer cAcc = cDao.getCustomerByUsername(acc.getUsername());
      
        List<Bag> list = cDao.loadBag(cAcc.getId());
        List<Product> listP=new ArrayList<>();
        int TotalAmount=0;
        for (Bag c : list) {
            Product a=cDao.getProductByID(c.getProductid());
            TotalAmount+=c.getAmount()*a.getPrice();
            listP.add(new Product(a.getId(), 
                    a.getName(), 
                    a.getImage(), 
                    a.getPrice(), 
                    a.getMemberid(),
                    c.getAmount()));
        }

        int totalMoney=TotalAmount;

       // int amountCart=dao.getAmountProduct(a.getId());
      //  session.setAttribute("am", amountCart);
        request.setAttribute("list", listP);
        request.setAttribute("aid", cAcc.getId());
        request.setAttribute("totalAmount", TotalAmount);
        request.setAttribute("totalMoney", totalMoney);
        request.getRequestDispatcher("Cart1.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
