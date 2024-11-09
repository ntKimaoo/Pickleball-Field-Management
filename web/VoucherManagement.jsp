<%-- 
    Document   : dashboard
    Created on : Sep 28, 2024, 9:56:26 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->

        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                list-style-type: none;
                padding: 0;
                margin: 20px 0;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination a {
                display: block;
                padding: 8px 16px;
                text-decoration: none;
                color: #007bff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .pagination a:hover {
                background-color: #f1f1f1;
            }

            .pagination a.active {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }

            .pagination a.disabled {
                color: #ccc;
                cursor: not-allowed;
                border-color: #ddd;
            }
            .popup {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }

            .popup-content {
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 400px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            .popup label {
                display: block;
                margin: 10px 0 5px;
            }

            .popup input {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
            }

            .popup button {
                background-color: #00ACED;
                color: white;
                border: none;
                padding: 10px 15px;
                cursor: pointer;
            }

            .popup button:hover {
                background-color: #3C91E6;
            }
            .popup select{
                width: 100%;
                padding: 8px;
                margin-bottom: 20px;
            }
        </style>
        <!-- My CSS -->

        <link rel="stylesheet" href="css/style_dashboard.css">

        <title>ADMIN DASHBOARD</title>
    </head>
    <body>

        <%@include file="sidebardashboard.jsp" %>
        <section id="content">
            <%@include file="headerdashboard.jsp" %>

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Voucher List</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div style="display: flex; align-items: center; justify-content: space-between">
                            <form style="display: flex;">
                                <div class="head" style="margin-right: 20px">
                                    <select id="statusSelect" name="sort" onchange="this.form.submit()">
                                        <option value="">Sort</option>
                                        <option value="low" ${param.sort == 'low' ? 'selected' : ''}>%: Thấp đến cao</option>
                                        <option value="high" ${param.sort == 'high' ? 'selected' : ''}>%: Cao đến thấp</option>
                                    </select>
                                </div>
                                <div class="head" style="margin-right: 20px">
                                    <select id="statusSelect" name="status" onchange="this.form.submit()">
                                        <option value="">Số lượng</option>
                                        <option value="left" ${param.status == 'left' ? 'selected' : ''}>Đã hết</option>
                                        <option value="noLeft" ${param.status == 'noLeft' ? 'selected' : ''}>Chưa hết</option>
                                    </select>
                                </div>
                            </form>
                            <div class="head">
                                <button type="button" id="openPopup" class="btn btn-primary" data-toggle="modal" data-target="#addStaffModal" style="background-color: #00aced;color: white;padding: 5px 10px;border-radius: 10px; border: none; font-size: 16px;cursor: pointer">
                                    <i class='bx bxs-cloud-download' ></i>
                                    <span>Add new voucher</span>
                                </button>
                            </div>
                        </div>
                        <table>
                            <thead> 
                                <tr>
                                    <th>Code</th>
                                    <th>Percent Sale</th>
                                    <th>Expire Date</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${listVoucher != null}">
                                    <c:forEach var="s" items="${listVoucher}">
                                        <tr>
                                            <td>${s.code}</td>
                                            <td>${s.percent} %</td>
                                            <td>
                                                <fmt:formatDate value="${s.expiredate}" pattern="dd/MM/yyyy" />
                                            </td>
                                            <td>${s.quantity}</td>
                                            <td>
                                                <a href="">Edit</a> |
                                                <a href="">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div><!-- phan trang default -->

                    <ul class="pagination">
                        <li>
                            <c:if test="${pageIndex == 1}">
                                <a class="disabled">Previous</a>
                            </c:if>
                            <c:if test="${pageIndex > 1}">
                                <a href="vouchermanager?index=${pageIndex - 1}&sort=${currentSort}&status=${currentStatus}">
                                    Previous
                                </a>
                            </c:if>
                        </li>
                        <c:forEach begin="1" end="${endP}" var="i">
                            <li>
                                <a class="${pageIndex == i ? 'active' : ''}" href="vouchermanager?index=${i}&sort=${currentSort}&status=${currentStatus}">
                                    ${i}
                                </a>
                            </li>
                        </c:forEach>
                        <li>
                            <c:if test="${pageIndex < endP}">
                                <a href="vouchermanager?index=${pageIndex + 1}&sort=${currentSort}&status=${currentStatus}">Next</a>
                            </c:if>
                            <c:if test="${pageIndex == endP}">
                                <a class="disabled">Next</a>
                            </c:if>
                        </li>
                    </ul>

            </main>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span id="closePopup" class="close">&times;</span>
                    <h2 style="text-align: center">Add New Voucher</h2>
                    <form id="voucherForm" action="addnewvoucher" method="GET">
                        <label for="date">Hạn sử dụng (ngày):</label>
                        <input type="number" min="1" id="date" name="date" required>

                        <label for="condition">Condition:</label>
                        <input type="text" id="condition" name="condition">

                        <label for="percent">Phần trăm giảm (%):</label>
                        <input type="number" min="1" max="100" id="percent" name="percent" required>

                        <label for="quantity">Số lượng:</label>
                        <input type="number" min="1" id="quantity" name="quantity">

                        <button type="submit">Add Voucher</button>
                    </form>
                </div>
            </div>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="script.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
                                        document.getElementById('openPopup').onclick = function () {
                                            document.getElementById('popup').style.display = 'flex';
                                        }

                                        document.getElementById('closePopup').onclick = function () {
                                            document.getElementById('popup').style.display = 'none';
                                        }

                                        document.getElementById('voucherForm').onsubmit = function () {
                                            alert('Thêm voucher thành công');

                                        }
        </script>
        <script>
            document.getElementById('categorySelect').addEventListener('change', function () {
                var selectedCategory = this.value;
                if (selectedCategory) {
                    window.location.href = 'filteruser?category=' + selectedCategory; // Dẫn tới URL mong muốn
                }
            });
            document.getElementById('statusSelect').addEventListener('change', function () {
                var selectedCategory = this.value;
                if (selectedCategory) {
                    window.location.href = 'filterStatus?status=' + selectedCategory; // Dẫn tới URL mong muốn
                }
            });

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </body>
</html>
