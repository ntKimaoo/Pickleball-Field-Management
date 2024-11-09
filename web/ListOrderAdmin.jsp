<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>List Order Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            padding: 20px;
        }

        .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            background-color: #fff;
            overflow: hidden;
            margin-top: 20px;
        }

        .card-body {
            padding: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table thead th {
            background-color: #28a745;
            color: #fff;
            padding: 10px;
            text-align: left;
        }

        .table tbody tr {
            transition: background-color 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table tbody td {
            padding: 10px;
            border: 1px solid #dee2e6;
        }

        .btn {
            padding: 5px 10px;
            margin-right: 5px;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-info {
            background-color: #17a2b8;
            border: none;
        }

        .btn i {
            margin-right: 5px;
        }

        .bg-success {
            background-color: #28a745 !important;
            color: white;
        }

        /* Styling for the filter form */
        .filter-form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .filter-form label {
            font-weight: bold;
            font-size: 16px;
        }

        .filter-form input[type="date"],
        .filter-form select,
        .filter-form button {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .filter-form button {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .filter-form button:hover {
            background-color: #0056b3;
        }
    </style>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/style_dashboard.css">
</head>
<body>

    <div class="container mt-4 text-center">

        <%@include file="sidebardashboard.jsp" %>
        <section id="content">
            <%@include file="headerdashboard.jsp" %>
            <!-- Form to filter transactions by date and type -->
            <div class="d-flex justify-content-center" style="margin-top: 20px">
                <form class="filter-form" method="post" action="order-list">
                    <div>
                        <label for="fromDate" class="form-label">From:</label>
                        <input type="date" class="form-control" id="fromDate" name="fromDate">
                    </div>
                    <div>
                        <label for="toDate" class="form-label">To:</label>
                        <input type="date" class="form-control" id="toDate" name="toDate">
                    </div>
                    <button type="submit" class="btn btn-primary">View</button>

                </form>
            </div>

            <section class="content">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="bg-success">
                                        <th>Mã đơn hàng</th>
                                        <th>Tổng đơn hàng</th>
                                        <th>Ngày mua</th>
                                        <th>Trạng thái</th>
                                        <th width="163">Công cụ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.total}</td>
                                            <td>${order.date}</td>
                                            <td>${order.ispayment ? "Đã thanh toán" : "Chưa thanh toán"}</td>
                                            <td>
                                                <c:if test="${!order.ispayment}">
                                                    <a href="order-list?action=payment&id=${order.id}" class="btn btn-primary">
                                                        <i class="fas fa-money-check-alt"></i> Thanh toán
                                                    </a>
                                                </c:if>
                                                <a href="orderdetail?id=${order.id}" class="btn btn-info">
                                                    <i class="fas fa-eye"></i> Xem chi tiết
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty orders}">
                                        <tr>
                                            <td colspan="5" class="text-center">Không có đơn hàng nào.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </section>

    </div>

</body>
</html>
