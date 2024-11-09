/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Item;
import dal.CategoryDAO;
import dal.ItemDAO;
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
public class ItemManager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ItemManager</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ItemManager at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ItemDAO idao = new ItemDAO();
        CategoryDAO cdao = new CategoryDAO();

        String id = request.getParameter("iid");
        boolean status = Boolean.parseBoolean(request.getParameter("changeStatus"));
        idao.updateItemStatus(id, !status);

        String cidParam = request.getParameter("cid");
        String statusParam = request.getParameter("itemStatus");
        List<Item> itemList;

        if (cidParam != null && !cidParam.isEmpty() && statusParam != null && !statusParam.isEmpty()) {
            int cid = Integer.parseInt(cidParam);
            boolean istatus = Boolean.parseBoolean(statusParam);
            itemList = cdao.getStatusById(cid, istatus);
        } else if (cidParam != null && !cidParam.isEmpty()) {
            int cid = Integer.parseInt(cidParam);
            itemList = cdao.getItemByCID(cid);
        } else if (statusParam != null && !statusParam.isEmpty()) {
            boolean istatus = Boolean.parseBoolean(statusParam);
            itemList = cdao.getStatus(istatus);
        } else {
            int pageSize = 8;
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            itemList = idao.getPaging(page, pageSize);
            int totalItem = idao.getNumberPageItem();
            int totalPage = totalItem / pageSize;
            if (totalItem % pageSize != 0) {
                totalPage += 1;
            }
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
        }

        request.setAttribute("itemList", itemList);
        request.setAttribute("categoryList", cdao.getAllCategory());
        request.getRequestDispatcher("ItemManager.jsp").forward(request, response);
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
