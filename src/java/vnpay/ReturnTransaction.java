/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vnpay;

import Model.Account;
import Model.Customer;
import com.vnpay.common.Config;
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
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author TuấnAnh Hà
 */
@WebServlet(name = "ReturnTransaction", urlPatterns = {"/transaction"})
public class ReturnTransaction extends HttpServlet {

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
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        CustomerDAO cDao = new CustomerDAO();
        AccountDAO aDao = new AccountDAO();

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);

        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
        String vnp_ResponseCode = request.getParameter("vnp_TransactionNo");
        String vnp_BankCode = request.getParameter("vnp_BankCode");
        String vnp_PayDate = request.getParameter("vnp_PayDate");
//        String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                HttpSession session = request.getSession();
                Account acc = (Account) session.getAttribute("user");
                Customer cAcc = cDao.getCustomerByUsername(acc.getUsername());
                if (!(Integer.parseInt(vnp_Amount) / 100000 == 540 || Integer.parseInt(vnp_Amount) / 100000 == 900 || Integer.parseInt(vnp_Amount) / 100000 == 99)) {
                    cDao.updatePoint(((Integer.parseInt(vnp_Amount) / 100000)), cAcc.getId());
                   
                    cDao.insertNotify(cAcc.getId(), "Bạn đã nạp thành công " + (Integer.parseInt(vnp_Amount) / 100000) + " điểm");
                     cDao.transactionHistory(cAcc.getId(), (Integer.parseInt(vnp_Amount) / 100), "point");
                      cDao.updateMembership(Integer.toString(cAcc.getId()));
                      request.setAttribute("vnp_TxnRef", vnp_TxnRef);
                request.setAttribute("vnp_Amount", vnp_Amount);
                request.setAttribute("vnp_OrderInfo", vnp_OrderInfo);
                request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                request.setAttribute("vnp_BankCode", vnp_BankCode);
                request.setAttribute("vnp_PayDate", vnp_PayDate);
                request.setAttribute("vnp_TransactionStatus", "Thành công");
                request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
                return;
                }
               
                
                //System.out.println("abcyxz");
                if (Integer.parseInt(vnp_Amount) / 100 == 99000) {
                    cDao.transactionHistory(cAcc.getId(), (Integer.parseInt(vnp_Amount) / 100), "membership");
                cDao.insertNotify(cAcc.getId(), "Bạn đã gia hạn thành công gói " + (Integer.parseInt(vnp_Amount)/100));
                cDao.updateMembership(Integer.toString(cAcc.getId()));
                    cDao.addMembershipForBuyingMembership(cAcc.getId(), LocalDateTime.now().plusMonths(1).toString().split("T")[0]);
                }else
                if (Integer.parseInt(vnp_Amount) / 100 == 540000) {
                    cDao.transactionHistory(cAcc.getId(), (Integer.parseInt(vnp_Amount) / 100), "membership");
                cDao.insertNotify(cAcc.getId(), "Bạn đã gia hạn thành công gói " + (Integer.parseInt(vnp_Amount)/100));
                cDao.updateMembership(Integer.toString(cAcc.getId()));
                    cDao.addMembershipForBuyingMembership(cAcc.getId(), LocalDateTime.now().plusMonths(6).toString().split("T")[0]);
                }else
                if (Integer.parseInt(vnp_Amount) / 100 == 900000) {
                    cDao.transactionHistory(cAcc.getId(), (Integer.parseInt(vnp_Amount) / 100), "membership");
                cDao.insertNotify(cAcc.getId(), "Bạn đã gia hạn thành công gói " + (Integer.parseInt(vnp_Amount)/100));
                cDao.updateMembership(Integer.toString(cAcc.getId()));
                    cDao.addMembershipForBuyingMembership(cAcc.getId(), LocalDateTime.now().plusMonths(12).toString().split("T")[0]);
                }
                
                request.setAttribute("vnp_TxnRef", vnp_TxnRef);
                request.setAttribute("vnp_Amount", vnp_Amount);
                request.setAttribute("vnp_OrderInfo", vnp_OrderInfo);
                request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                request.setAttribute("vnp_BankCode", vnp_BankCode);
                request.setAttribute("vnp_PayDate", vnp_PayDate);
                request.setAttribute("vnp_TransactionStatus", "Thành công");
                request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
            } else {
                request.setAttribute("vnp_TxnRef", vnp_TxnRef);
                request.setAttribute("vnp_Amount", vnp_Amount);
                request.setAttribute("vnp_OrderInfo", vnp_OrderInfo);
                request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
                request.setAttribute("vnp_BankCode", vnp_BankCode);
                request.setAttribute("vnp_PayDate", vnp_PayDate);
                request.setAttribute("vnp_TransactionStatus", "Không thành công");
                request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("vnp_TxnRef", vnp_TxnRef);
            request.setAttribute("vnp_Amount", vnp_Amount);
            request.setAttribute("vnp_OrderInfo", vnp_OrderInfo);
            request.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
            request.setAttribute("vnp_BankCode", vnp_BankCode);
            request.setAttribute("vnp_PayDate", vnp_PayDate);
            request.setAttribute("vnp_TransactionStatus", "invalid signature");
            request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
        }

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
