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
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author kiennn
 */
public class VoucherManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VoucherManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO dao = new VoucherDAO();
        String getSort = request.getParameter("sort");
        String getStatus = request.getParameter("status");
        String getIndex = request.getParameter("index");
        List<Voucher> listIsLeft = new ArrayList<>();
        List<Voucher> l = new ArrayList<>();
        int index;
        int countotalUser = dao.getAllTotalVoucher();
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
        l = dao.getAllVoucher(index);
        if (getSort != null && getStatus == "") {
            if (getSort.equals("low") && !getSort.isEmpty()) {
                System.out.println("low");
                l.sort(new Comparator<Voucher>() {
                    @Override
                    public int compare(Voucher o1, Voucher o2) {
                        return Integer.compare(o1.getPercent(), o2.getPercent());
                    }
                });

            } else if (getSort.equals("high") && !getSort.isEmpty()) {
                System.out.println("high");
                l.sort(new Comparator<Voucher>() {
                    @Override
                    public int compare(Voucher o1, Voucher o2) {
                        return Integer.compare(o2.getPercent(), o1.getPercent());
                    }
                });

            }
            request.setAttribute("listVoucher", l);
        } else if (getSort == "" && getStatus != null) {
            System.out.println("1");
            if (getStatus.equals("left") && !getStatus.isEmpty()) {
                System.out.println("2");
                for (Voucher voucher : l) {
                    if (voucher.getQuantity() == 0) {
                        listIsLeft.add(voucher);
                    }
                }
            } else if (getStatus.equals("noLeft") && !getStatus.isEmpty()) {
                System.out.println("3");
                for (Voucher voucher : l) {
                    if (voucher.getQuantity() >= 1) {
                        listIsLeft.add(voucher);
                    }
                }
            }
            request.setAttribute("listVoucher", listIsLeft);
        } else if (getSort != null && getStatus != null) {
            if (getStatus.equals("left")) {
                for (Voucher voucher : l) {
                    if (voucher.getQuantity() == 0) {
                        listIsLeft.add(voucher);
                    }
                }
                if (getStatus.equals("low")) {
                    listIsLeft.sort(new Comparator<Voucher>() {
                        @Override
                        public int compare(Voucher o1, Voucher o2) {
                            return Integer.compare(o1.getPercent(), o2.getPercent());
                        }
                    });
                } else if (getStatus.equals("high")) {
                    listIsLeft.sort(new Comparator<Voucher>() {
                        @Override
                        public int compare(Voucher o1, Voucher o2) {
                            return Integer.compare(o1.getPercent(), o2.getPercent());
                        }
                    });
                }
                request.setAttribute("listVoucher", listIsLeft);
            } else if (getStatus.equals("noLeft")) {
                for (Voucher voucher : l) {
                    if (voucher.getQuantity() >= 1) {
                        listIsLeft.add(voucher);
                    }
                }
                if (getStatus.equals("low")) {
                    listIsLeft.sort(new Comparator<Voucher>() {
                        @Override
                        public int compare(Voucher o1, Voucher o2) {
                            return Integer.compare(o1.getPercent(), o2.getPercent());
                        }
                    });
                } else if (getStatus.equals("high")) {
                    listIsLeft.sort(new Comparator<Voucher>() {
                        @Override
                        public int compare(Voucher o1, Voucher o2) {
                            return Integer.compare(o1.getPercent(), o2.getPercent());
                        }
                    });
                }
                request.setAttribute("listVoucher", listIsLeft);
            }
        } else {
            request.setAttribute("listVoucher", l);
        }
        request.setAttribute("currentSort", getSort);
        request.setAttribute("currentStatus", getStatus);
        request.getRequestDispatcher("VoucherManagement.jsp").forward(request, response);
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
