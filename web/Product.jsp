<%-- 
    Document   : Product
    Created on : Oct 29, 2024, 11:57:45 PM
    Author     : TuấnAnh Hà
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách sản phẩm</title>
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="keywords" content="intense web design multipurpose template">
        <meta name="date" content="Dec 26">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Ubuntu:400,400italic,500,700,700italic">
        <link rel="stylesheet" href="css/style.css">

    </head>
    <style>
        /* Centering container for the grid */
                    .center-container {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                background-color: #f3f6fa;
                padding: 20px;
            }

            /* Grid layout */
            .grid-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 24px;
                width: 100%;
                max-width: 1200px;
            }

            /* Each item card */
            .item-card {
                background-color: #ffffff;
                color: #333333;
                border-radius: 12px;
                text-align: center;
                padding: 20px;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .item-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
            }

            /* Image placeholder */
            .item-image {
                width: 100%;
                height: 160px;
                background-color: #f0f0f0;
                border-radius: 8px;
                margin-bottom: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 16px;
                color: #999999;
            }

            /* Product title */
            h3 {
                font-size: 1.2em;
                margin-bottom: 10px;
                color: #333333;
            }

            /* Button styles */
            .btn {
                display: inline-block;
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                text-align: center;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s;
            }

            .btn-success {
                background-color: #28a745;
                color: #ffffff;
            }

            .btn-success:hover {
                background-color: #218838;
                transform: scale(1.05);
            }

            /* Disabled button */
            .btn[disabled] {
                background-color: #bbbbbb;
                color: #666666;
                cursor: not-allowed;
            }

            /* Popup overlay */
            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 999;
            }

            /* Popup container */
            .popup-container {
                background: #ffffff;
                width: 90%;
                max-width: 400px;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                text-align: center;
                animation: popupAnimation 0.3s ease-out;
            }

            @keyframes popupAnimation {
                0% { transform: scale(0.9); opacity: 0; }
                100% { transform: scale(1); opacity: 1; }
            }

            /* Title and message inside the popup */
            .popup-title {
                font-size: 1.4em;
                margin-bottom: 10px;
                color: #333333;
            }

            .popup-message {
                margin: 15px 0;
                color: #555555;
            }

            /* Popup buttons */
            .popup-buttons {
                display: flex;
                justify-content: space-between;
                gap: 10px;
                margin-top: 20px;
            }

            .popup-button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.2s, transform 0.2s;
            }

            .confirm-button {
                background-color: #28a745;
                color: #ffffff;
            }

            .confirm-button:hover {
                background-color: #218838;
                transform: scale(1.05);
            }

            .cancel-button {
                background-color: #cccccc;
                color: #333333;
            }

            .cancel-button:hover {
                background-color: #b3b3b3;
                transform: scale(1.05);
            }
            .btn-success {
    background-color: #28a745;
    color: #ffffff;
    text-decoration: none;
}

.btn-success:hover {
    background-color: #218838;
    transform: scale(1.05);
}

    </style>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <h1 style="text-align: center; margin-bottom: 30px;margin-top: 50px">Item đổi thưởng</h1>
            <div class="center-container">
                <div class="grid-container">
                    <!-- Loop through each product in the list -->
                <c:forEach items="${listP}" var="p">
                    <div class="item-card">
                        <img src="${p.image}" class="item-image">
                        <h3>${p.name}</h3>

                        <!-- Check user's eligibility for purchase -->
                        <c:choose>
                            <c:when test="${highest >= p.memberid && acc.point >= p.price}">
                                <a href="javascript:void(0);" class="btn btn-success" onclick="openPopup('${p.price}', '${p.name}', '${p.id}')"> ${p.price}</a>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-success" disabled>${p.price}</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="popup-overlay" id="purchasePopup">
            <div class="popup-container">
                <h2 class="popup-title">Xác Nhận Mua Hàng</h2>
                <p class="popup-message">Bạn có chắc chắn muốn mua sản phẩm <strong id="popupProductName"></strong> với giá <strong id="popupPrice"></strong> không?</p>
                <div class="popup-buttons">
                    <button class="popup-button confirm-button" id="confirmButton">Xác nhận</button>
                    <button class="popup-button cancel-button" onclick="closePopup()">Hủy</button>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            // Function to open the popup
            function openPopup(price, name, id) {
                document.getElementById("popupPrice").innerText = price + " điểm";
                document.getElementById("popupProductName").innerText = name;
                document.getElementById("purchasePopup").style.display = "flex";

                // Set confirm button action
                document.getElementById("confirmButton").onclick = function () {
                    window.location.href = "addCart?pid=" + id + "&price=" + price;
                };
            }

            // Function to close the popup
            function closePopup() {
                document.getElementById("purchasePopup").style.display = "none";
            }
        </script>
        <script src="js/script.js"></script>
    </body>
</html>
