<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông báo</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
             body {
        background-color: #18191a;
        color: white;
        font-family: Arial, sans-serif;
    }

    a {
        text-decoration: none;
        color: inherit;
    }

            .notification-container {
                width: 530px;
                margin: 50px auto;
                background-color: #1c1e21;
                border-radius: 8px;
                color: white;
                padding: 10px;
            }

            .notification-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: relative;
            }

            .notification-header h2 {
                margin: 0;
                display: flex;
                align-items: center;
            }

            .header-menu {
                cursor: pointer;
                font-size: 18px;
                color: #888;
                margin-left: 10px;
            }

            .header-dropdown {
                display: none;
                position: absolute;
                top: 40px;
                right: 10px;
                background-color: #333;
                border-radius: 8px;
                padding: 10px;
                width: 200px;
                z-index: 1;
            }

            .header-dropdown.show {
                display: block;
            }

            .header-dropdown ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .header-dropdown ul li {
                padding: 10px;
                border-bottom: 1px solid #444;
                cursor: pointer;
                color: #ddd;
            }

            .header-dropdown ul li:hover {
                background-color: #444;
            }

            .notification-tabs {
                display: flex;
                gap: 10px;
                align-items: center;
            }

            .notification-tabs .tab {
                background-color: #333;
                border: none;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
            }

            .notification-tabs .tab.active {
                background-color: #4b4d50;
            }

            .notification-body {
                margin-top: 20px;
                max-height: 400px;
                overflow-y: auto;
            }

            .notification-item {
                display: flex;
                gap: 10px;
                padding: 10px;
                border-bottom: 1px solid #444;
                align-items: center;
                position: relative;
            }

            .notification-text {
                flex: 1;
            }

            .notification-text p {
                margin: 0;
                font-size: 14px;
            }

            .notification-text small {
                color: #999;
            }

            .unread-indicator {
                width: 10px;
                height: 10px;
                background-color: #00ff00;
                border-radius: 50%;
                position: absolute;
                top: 15px;
                right: 10px;
            }

            .menu-toggle {
                cursor: pointer;
                font-size: 18px;
                color: #888;
                position: absolute;
                top: 10px;
                right: 30px;
            }

            .dropdown-menu {
                display: none;
                position: absolute;
                top: 40px;
                right: 10px;
                background-color: #333;
                border-radius: 8px;
                padding: 10px;
                width: 200px;
                z-index: 1;
            }

            .dropdown-menu.show {
                display: block;
            }

            .dropdown-menu ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .dropdown-menu ul li {
                padding: 10px;
                border-bottom: 1px solid #444;
                cursor: pointer;
                color: #ddd;
            }

            .dropdown-menu ul li:hover {
                background-color: #444;
            }

            .notification-footer {
                text-align: center;
                padding: 10px;
            }

            .notification-footer .load-more {
                background-color: #444;
                border: none;
                color: white;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
            }

            .notification-footer .load-more:hover {
                background-color: #555;
            }

            /* Modal overlay */
            .modal-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            /* Modal content */
            .modal-content {
                background-color: #1c1e21;
                border-radius: 8px;
                width: 400px;
                padding: 20px;
                text-align: center;
                color: white;
            }

            .modal-content h2 {
                font-size: 18px;
                margin-bottom: 10px;
            }

            .modal-content p {
                font-size: 14px;
                color: #ccc;
                margin-bottom: 20px;
            }

            .modal-content button {
                background-color: #444;
                border: none;
                color: white;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                margin: 5px;
            }

            .modal-content button:hover {
                background-color: #555;
            }

            .confirm-btn {
                background-color: #1877f2;
            }

        </style>
    </head>
    <body>

        <div class="notification-container">
            <div class="notification-header">
                <h2>Thông báo
                    <span class="header-menu">
                        <i class="fas fa-ellipsis-h"></i>
                    </span>
                </h2>
                <div class="header-dropdown">
                    <ul>
                        <a href="readall"><li>Đánh dấu tất cả là đã đọc</li></a>
                        <a href="deleteall"><li>Xóa tất cả thông báo</li></a>
                    </ul>
                </div>
                <div class="notification-tabs">
                    <form action="notifications">
                        <button type="submit" class="tab active">Tất cả</button>
                    </form>
                    <form action="notifications" method="post">
                        <button class="tab">Chưa đọc</button>
                    </form>
                </div>
            </div>
            <div class="notification-body">
                <c:forEach var="notification" items="${listNotify}">
                    <div class="notification-item">
                        <c:if test="${!notification.is_read}">
                            <div class="unread-indicator"></div>
                        </c:if>
                        <div class="notification-text">
                            <p><strong>${notification.message}</strong></p>
                            <small>${notification.date}</small>
                        </div>
                        <div class="menu-toggle">
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <div class="dropdown-menu">
                            <ul>
                                <c:if test="${notification.is_read}">
                                    <a href="unread?id=${notification.id}"><li>Đánh dấu là chưa đọc</li></a>
                                        </c:if>
                                        <c:if test="${!notification.is_read}">
                                    <a href="read?id=${notification.id}"><li>Đánh dấu là đã đọc</li></a>
                                        </c:if>
                                <li onclick="showDeleteConfirm('${notification.id}')">Xóa thông báo này</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Modal confirmation for each notification -->
                    <div class="modal-overlay" id="deleteConfirmModal-${notification.id}" style="display:none;">
                        <div class="modal-content">
                            <p>Bạn có chắc chắn muốn xóa thông báo này không?</p>
                            <button class="confirm-btn" onclick="confirmDelete('${notification.id}')">Xác nhận</button>
                            <button onclick="closeDeleteConfirm('${notification.id}')">Hủy</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="notification-footer">
                <button class="load-more">Xem thông báo trước đó</button>
            </div>
        </div>

        <script>
            function showDeleteConfirm(notificationId) {
                document.getElementById('deleteConfirmModal-' + notificationId).style.display = 'flex';
            }

            function closeDeleteConfirm(notificationId) {
                document.getElementById('deleteConfirmModal-' + notificationId).style.display = 'none';
            }

            function confirmDelete(id) {
                window.location.href = 'deletenotify?id=' + id;
            }

            document.querySelectorAll('.menu-toggle').forEach(function (toggle) {
                toggle.addEventListener('click', function (event) {
                    event.stopPropagation();
                    const dropdown = this.nextElementSibling;
                    document.querySelectorAll('.dropdown-menu').forEach(function (menu) {
                        if (menu !== dropdown) {
                            menu.classList.remove('show');
                        }
                    });
                    dropdown.classList.toggle('show');
                });
            });

            document.querySelector('.header-menu').addEventListener('click', function (event) {
                event.stopPropagation();
                const dropdown = document.querySelector('.header-dropdown');
                dropdown.classList.toggle('show');
            });

            window.addEventListener('click', function (event) {
                if (!event.target.matches('.menu-toggle') && !event.target.closest('.dropdown-menu') && !event.target.closest('.header-dropdown')) {
                    document.querySelectorAll('.dropdown-menu, .header-dropdown').forEach(function (menu) {
                        menu.classList.remove('show');
                    });
                }
            });
        </script>

    </body>
</html>
