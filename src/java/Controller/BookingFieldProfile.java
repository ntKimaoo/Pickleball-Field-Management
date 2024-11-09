/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Account;
import dal.CustomerDAO;
import dal.FieldDAO;
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
 * @author kiennn
 */
@WebServlet(name="BookingFieldProfile", urlPatterns={"/bookingfieldfrofile"})
public class BookingFieldProfile extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingFieldProfile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingFieldProfile at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession();
        CustomerDAO cdao=new CustomerDAO();
        Account a=(Account) session.getAttribute("user");
        String id=Integer.toString(cdao.getCustomerByUsername(a.getUsername()).getId());
        FieldDAO fdao= new FieldDAO();
        String rentid=request.getParameter("rentid");
        if(rentid!=null){fdao.deleteRentField(rentid);response.sendRedirect("bookingfieldfrofile");}else{
        request.setAttribute("rent", fdao.getRentFieldAll(id));
        request.getRequestDispatcher("BookingFieldProfile.jsp").forward(request, response);
    } }

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
