/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Base;
import Model.Employee;
import dal.BaseDAO;
import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class EmployeeManage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeManage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmployeeDAO emDao = new EmployeeDAO();
        BaseDAO baseDao = new BaseDAO();

        List<Base> listBase = baseDao.getAll();
        String baseid = request.getParameter("khuVuc");
        String statusParam = request.getParameter("status");
        List<Employee> listEm = new ArrayList<>();
        //phan trang
        if (baseid != null && !baseid.isEmpty() && statusParam != null && !statusParam.isEmpty()) {
            int cid = Integer.parseInt(baseid);
            boolean istatus = Boolean.parseBoolean(statusParam);
            listEm = emDao.getEmFilterById(cid, istatus);
        } else if (baseid != null && !baseid.isEmpty()) {
            int cid = Integer.parseInt(baseid);
            listEm = emDao.getEmFilterById(cid);
        } else if (statusParam != null && !statusParam.isEmpty()) {
            boolean istatus = Boolean.parseBoolean(statusParam);
            listEm = emDao.getEmFilterByStatus(istatus);
        } else {
            String getIndex = request.getParameter("index");
            int index;
            int countotalUser = emDao.getAllTotalEm();
            if (request.getParameter("index") == null) {
                index = 1;
            } else {
                index = Integer.parseInt(getIndex);
            }
            int endPage = (countotalUser / 6);
            if (countotalUser % 6 != 0) {
                endPage++;
            }
            request.setAttribute("endP", endPage);
            request.setAttribute("pageIndex", index);
            listEm = emDao.getEmFilter(index);
        }

        //filter
        String khuVuc = request.getParameter("khuVuc");
        String status = request.getParameter("status");
        
        request.setAttribute("listEm", listEm);
        request.setAttribute("listBase", listBase);
        request.getRequestDispatcher("EmployeeManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
