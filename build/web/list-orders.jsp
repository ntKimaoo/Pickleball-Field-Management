<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
/* Định dạng tổng thể cho container */
.container {
    max-width: 800px;
    margin: auto;
    font-family: Arial, sans-serif;
    text-align: center;
}

/* Định dạng cho tiêu đề */
.heading_container h2 {
    font-size: 28px;
    font-weight: bold;
    color: #000;
    margin-bottom: 20px;
}

/* Định dạng cho bảng */
.table {
    width: 100%;
    border-collapse: collapse;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 0 auto; /* Căn giữa bảng */
}

/* Định dạng cho tiêu đề cột */
.table thead th {
    font-weight: bold;
    font-size: 16px;
    color: #333;
    background-color: #f8f9fa;
    padding: 12px 15px;
    text-align: left;
    border-bottom: 2px solid #dee2e6;
}

/* Định dạng cho các hàng trong bảng */
.table tbody tr {
    border-bottom: 1px solid #dee2e6;
}

/* Định dạng cho các ô trong bảng */
.table tbody td {
    padding: 12px 15px;
    font-size: 15px;
    color: #333;
    text-align: left; /* Canh trái nội dung */
}

/* Định dạng cho nút chi tiết */
.table .btn-primary {
    background-color: #007bff;
    color: #fff;
    font-size: 14px;
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease;
    text-align: center;
}

/* Hiệu ứng hover cho nút chi tiết */
.table .btn-primary:hover {
    background-color: #0056b3;
    color: #fff;
}

</style>

<section class="container layout_padding">
    <div class="heading_container heading_center">
        <h2>Đơn hàng của tôi</h2>
    </div>
    <table class="table mt-5">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Tổng số tiền</th>
                <th>Trạng thái</th>
                <th>Ngày đặt</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.total}</td>
                    <td><c:out value="${order.ispayment ? 'Đã Nhận Hàng' : 'Chưa nhận hàng'}"/></td>
                    <td>${order.date}</td>
                    <td><a href="orderdetail?id=${order.id}" class="btn btn-primary btn-sm">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
