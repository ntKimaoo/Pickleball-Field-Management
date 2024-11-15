/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AccountDAO;
import dal.BaseDAO;
import dal.CustomerDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Map;

/**
 *
 * @author thang
 */
@WebServlet(name="DashBoardServlet", urlPatterns={"/dashboard"})
public class DashBoardServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DashBoardServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashBoardServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        AccountDAO adao=new AccountDAO();
        if(request.getParameter("id")!=null){adao.changeStatus(adao.getAccountByUsername(request.getParameter("id")));}
        request.setAttribute("listaccount", adao.getAll());
        Map<String, Integer> countBase = new BaseDAO().bookingsCount();
        request.setAttribute("ngayThangHienTai", LocalDate.now());
        request.setAttribute("countBase", countBase);
        
        Map<String, Integer> hoursPerDay = new BaseDAO().bookingsCount();
        request.setAttribute("hoursPerDay", hoursPerDay);

        Map<String, Integer> numberOfUser = new AccountDAO().countNumUserJoin();
        request.setAttribute("numberOfUser", numberOfUser);
        
        OrderDAO odDao = new OrderDAO();
        int month=LocalDate.now().getMonthValue();
        int year =LocalDate.now().getYear();
        int numberOforder = odDao.getNumberOfOrder(month,year);
        request.setAttribute("numberOforder", numberOforder);
        CustomerDAO cusDao = new CustomerDAO();
        int numOfCus = cusDao.getAllTotalUser();
         request.setAttribute("numOfCus", numOfCus);
        request.getRequestDispatcher("Chart.jsp").forward(request, response);
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
