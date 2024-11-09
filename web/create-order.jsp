

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Định dạng tổng thể cho container */
    .container {
        max-width: 800px;
        margin: auto;
        font-family: Arial, sans-serif;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh; /* Căn giữa dọc */
    }

    /* Định dạng cho tiêu đề */
    .heading_container h2 {
        font-size: 28px;
        font-weight: bold;
        color: #000;
        margin-bottom: 20px;
    }

    /* Định dạng cho nút "Trở về giỏ hàng" */
    .btn-box a {
        background-color: #ffd700; /* Màu vàng cho nút */
        color: #000;
        font-size: 16px;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    /* Hiệu ứng hover cho nút */
    .btn-box a:hover {
        background-color: #e6b800; /* Màu vàng đậm hơn khi hover */
        color: #000;
    }

</style>
<section class="container layout_padding">
    <div class="heading_container heading_center">
        <h2>Đơn hàng của bạn đã được tạo thành công!</h2>
    </div>
    <div class="shop_section">
        <div class="btn-box">
            <a href="loadorder" class="btn1">Xem Hóa Đơn</a>
        </div>
    </div>
</section>


