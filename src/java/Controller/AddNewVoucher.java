/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Voucher;
import dal.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author kiennn
 */
public class AddNewVoucher extends HttpServlet {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int CODE_LENGTH = 8;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddNewVoucher</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewVoucher at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int hanSuDung= Integer.parseInt(request.getParameter("date"));
        LocalDate today = LocalDate.now();
        LocalDate expireDate = today.plusDays(hanSuDung);
        java.sql.Date sqlDate = java.sql.Date.valueOf(expireDate);
        int percent= Integer.parseInt(request.getParameter("percent"));
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        String condition=request.getParameter("condition");
        String code = generateRandomCode();
        Voucher v = new Voucher(code, sqlDate, condition, quantity, percent);
        VoucherDAO dao = new VoucherDAO();
        dao.insertVoucher(v);
        request.getRequestDispatcher("vouchermanager").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    public String generateRandomCode() {
        SecureRandom random = new SecureRandom();
        StringBuilder code = new StringBuilder(CODE_LENGTH);
        
        for (int i = 0; i < CODE_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            code.append(CHARACTERS.charAt(index));
        }
        
        return code.toString();
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
