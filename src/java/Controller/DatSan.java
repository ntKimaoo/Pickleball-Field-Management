/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import dal.AccountDAO;
import dal.BaseDAO;
import dal.CustomerDAO;
import dal.FieldDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class DatSan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DatSan</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatSan at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BaseDAO bdao = new BaseDAO();
        FieldDAO fdao = new FieldDAO();
        CustomerDAO cdao = new CustomerDAO();
        String base = request.getParameter("base");
        String field = request.getParameter("field");
        String choose = request.getParameter("choose");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        if (base == null) {
            request.setAttribute("baselist", bdao.getAll());
            request.setAttribute("fieldlist", fdao.getAllByBase(Integer.parseInt(base)));
            request.getRequestDispatcher("FieldBooking.jsp").forward(request, response);
        } else if (base != null && field == null) {
            request.setAttribute("baselist", bdao.getAll());
            request.setAttribute("base", base);
            request.setAttribute("fieldlist", fdao.getAllByBase(Integer.parseInt(base)));
            request.setAttribute("field", 1);
            request.setAttribute("fieldimage", fdao.getFieldById(1));
            request.getRequestDispatcher("FieldBooking.jsp").forward(request, response);
        } else if (base != null && field != null && choose == null) {
            request.setAttribute("baselist", bdao.getAll());
            request.setAttribute("base", base);
            request.setAttribute("fieldlist", fdao.getAllByBase(Integer.parseInt(base)));
            request.setAttribute("field", field);
            request.setAttribute("fieldimage", fdao.getFieldById(Integer.parseInt(field)));
            request.getRequestDispatcher("FieldBooking.jsp").forward(request, response);
        } else {
            request.setAttribute("base", base);
            request.setAttribute("field", field);
            request.getRequestDispatcher("schedule?week=0").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String selectedSlots = request.getParameter("selectedSlots");
        String base = request.getParameter("base");
        String field = request.getParameter("field");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        FieldDAO fdao = new FieldDAO();
        CustomerDAO cdao = new CustomerDAO();
        AccountDAO adao = new AccountDAO();
        if (selectedSlots != null && !selectedSlots.trim().isEmpty()) {
            List<String> slotsList = new ArrayList<>(Arrays.asList(selectedSlots.split(",")));
            if (cdao.getCustomerByUsername(a.getUsername()).getPoint() >= (slotsList.size() * fdao.getFieldById(Integer.parseInt(field)).getCost())) {
                Date inputDate = cdao.getMembershipExpiredate(cdao.getCustomerByUsername(a.getUsername()).getId());
                Date today = new Date();
                if(fdao.getFieldById(Integer.parseInt(field)).isViponly()){
                if (inputDate == null) {
                    request.setAttribute("error", "This base is only for vip");
                    request.getRequestDispatcher("schedule?week=0").forward(request, response);
                } else if (!inputDate.after(today)) {
                    request.setAttribute("error", "This base is only for vip");
                    request.getRequestDispatcher("schedule?week=0").forward(request, response);
                }   
            } else {
                for (String slot : slotsList) {
                    fdao.insertRentField(slot, cdao.getCustomerByUsername(a.getUsername()).getId(), field);
                    cdao.updatePoint(-fdao.getFieldById(Integer.parseInt(field)).getCost(), cdao.getCustomerByUsername(a.getUsername()).getId());
                }
            }
                request.setAttribute("error", "Booking successfully!");
             request.getRequestDispatcher("schedule?week=0").forward(request, response);
        }else{
        request.setAttribute("error", "You don't have enoung points, please buy more!");
             request.getRequestDispatcher("schedule?week=0").forward(request, response);}
    }}

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
