

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .container {
    width: 80%;
    margin: 0 auto;
    font-family: Arial, sans-serif;
}

.text-primary {
    color: #007bff;
}

.text-center {
    text-align: center;
}

.layout_padding {
    padding: 20px;
}

table.table {
    width: 100%;
    border-collapse: collapse;
}

.table-bordered {
    border: 1px solid #dee2e6;
}

.table-bordered th, .table-bordered td {
    border: 1px solid #dee2e6;
    padding: 8px;
    text-align: center;
}

thead tr.bg-success {
    background-color: #28a745;
    color: #fff;
}

tbody tr td {
    vertical-align: middle;
}

h2, h4 {
    font-weight: bold;
}

p {
    font-size: 16px;
}

img.img-fluid {
    width: 60px;
    height: auto;
}

tbody tr:last-child td {
    font-weight: bold;
    text-align: right;
    padding-right: 15px;
}

h4.text-primary {
    margin-top: 20px;
}


    </style>

    <section class="container layout_padding">
        <h2 class="text-center text-primary">HOÁ ĐƠN - ${order.id}</h2>
    <br>
    <div class="container">
            <button type="button" class="btn btn-primary" onclick="window.location.href='home'">Về Trang Chủ</button>
        </div>
    <h4 class="text-primary"><b>I. THÔNG TIN CÁ NHÂN</b></h4>
    <p><b>Tên Người Dùng: </b>${user.fullName}</p>
 
    <p><b>Email: </b>${user.email}</p>
    <br>
    <h4 class="text-primary"><b>II. CHI TIẾT ĐƠN HÀNG</b></h4>
    <table class="table table-bordered">
        <thead>
            <tr class="bg-success">
                <th>STT</th>
                <th>Tên Sản Phẩm</th>
                <th>Hình ảnh</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
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
            <tr>
                <td colspan="5"><b>Tổng: </b></td>
                <td>${totalAmount}</td>
            </tr>
        </tbody>
    </table>
    <h4 class="text-primary"><b>III. TRẠNG THÁI ĐƠN HÀNG: ${order.ispayment ? 'Đã Nhận Hàng' : 'Chưa nhận hàng'}</b></h4>
</section>

