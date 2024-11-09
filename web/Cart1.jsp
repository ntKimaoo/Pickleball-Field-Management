<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Vật Phẩm Đã Mua</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            .rd-navbar-top-panel {
                background-color: #000;
            }

            .rd-navbar.rd-navbar-fixed,
            .rd-navbar.rd-navbar-static {
                background-color: #000 !important;
            }

            .rd-navbar-wrap {
                background-color: #000 !important;
            }

            .rd-navbar-menu-wrap {
                background-color: #000 !important;
            }
            .rd-navbar a {
                color: #fff !important;
            }

            .rd-navbar a:hover,
            .rd-navbar a:focus {
                color: #f0f0f0 !important;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f9fafb;
                color: #333;
            }
            .shopping-cart .table {
                width: 100%;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .shopping-cart .table thead th {
                font-weight: bold;
                color: #333;
                background-color: #f8f9fa;
                text-transform: uppercase;
                font-size: 0.9rem;
                border-bottom: 2px solid #dee2e6;
                text-align: center;
            }
            .shopping-cart .table tbody td {
                vertical-align: middle;
                text-align: center;
            }
            .shopping-cart .table img {
                width: 60px;
                height: auto;
                border-radius: 4px;
            }
            .shopping-cart .btn {
                background-color: #f7d94c;
                color: #333;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 5px;
                text-transform: uppercase;
                transition: background-color 0.3s ease;
            }
            .shopping-cart .btn:hover {
                background-color: #e5c441;
                color: #fff;
            }
            .shopping-cart h3 {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                margin: 20px 0;
            }
            .shopping-cart .order-button-container {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>

        <div class="shopping-cart">
            <div class="container">
                <div class="pb-5">
                    <div class="row">
                        <div class="col-lg-12 bg-white rounded shadow-sm mb-5">
                            <h3> Vật Phẩm Đã Mua</h3>
                            <!-- Shopping cart table -->
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">STT</th>
                                            <th scope="col">Tên Sản Phẩm</th>
                                            <th scope="col">Hình ảnh</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="o" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${o.name}</td>
                                                <td><img src="${o.image}" alt="Product Image" class="img-fluid rounded shadow-sm"></td>
                                                <td><strong>${o.price}</strong></td>
                                                <td><span>${o.amount}</span></td> <!-- Quantity displayed as plain text -->
                                                <td><strong>${o.price * o.amount}</strong></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Order button centered -->
                            <c:if test="${not empty list}">
                                <div class="order-button-container">
                                    <form action="createorder">
                                        <input type="hidden" name="total" value="${totalAmount}">
                                        <button type="submit" class="btn">Tạo đơn hàng</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
