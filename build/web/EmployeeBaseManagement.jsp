<%-- 
    Document   : dashboard
    Created on : Sep 28, 2024, 9:56:26 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h1>Employee List</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div style="display: flex; align-items: center; justify-content: space-between">

                            <div class="head">
                                <button type="button" id="openPopup" class="btn btn-primary" data-toggle="modal" data-target="#addStaffModal" style="background-color: #00aced;color: white;padding: 5px 10px;border-radius: 10px; border: none; font-size: 16px;cursor: pointer">
                                    <i class='bx bxs-cloud-download' ></i>
                                    <span>Add new staff</span>
                                </button>
                            </div>
                        </div>
                        <table>
                            <thead> 
                                <tr>
                                    <th>Id</th>
                                    <th>Full Name</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>BaseId</th>
                                    <th>Status</th>
                                    <th>Online</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${listEm != null}">
                                    <c:forEach var="s" items="${listEm}">
                                        <tr>
                                            <td>${s.id}</td>
                                            <td>${s.fullname}</td>
                                            <td>${s.getUsername()}</td>
                                            <td>${s.email}</td>
                                            <td>${s.phonenumber}</td>
                                            <td>${s.baseid}</td>
                                            <td>
                                                <c:if test="${s.isActived==true}">
                                                    Active
                                                </c:if>
                                                <c:if test="${s.isActived==false}">
                                                    Inactive
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${s.isOnline()==true}">
                                                    Online
                                                </c:if>
                                                <c:if test="${s.isOnline()==false}">
                                                    Offline
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${s.isActived==true}">
                                                    <a href="deactiveacc?staffId=${s.id}">Disable</a></c:if>
                                                <c:if test="${s.isActived==false}">
                                                    <a href="activeacc?staffId=${s.id}">Enable</a></c:if>
                                                </td>
                                               </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>           
                <div><!-- phan trang default -->
                    <c:if test="${filterRole==null&&filterStatus==null}">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageIndex==1}">
                                    <a class="disabled" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                                    <c:if test="${pageIndex>1}">
                                    <a href="employeemanagement?index=${pageIndex-1}" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="employeemanagement?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="employeemanagement?index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>

                </div>
            </main>
            <div id="popup" class="popup">
                <div class="popup-content">
                    <span id="closePopup" class="close">&times;</span>
                    <h2 style="text-align: center">Add New Staff</h2>
                    <form id="staffForm" action="addnewstaff" method="POST">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>

                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>

                        <label for="fullname">Full Name:</label>
                        <input type="text" id="fullname" name="fullname" required>


                        <input type="text" id="base" name="base" value="${id}" hidden="">
                        <button type="submit">Add Staff</button>
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

            document.getElementById('staffForm').onsubmit = function () {
                const email = document.getElementById('email').value;
                const username = document.getElementById('username').value;
                const existingEmails = [
            <c:forEach items="${listEm}" var="l" varStatus="status">
                "${l.email}"<c:if test="${!status.last}">, </c:if>
            </c:forEach>
                ];
                const existingUsernames = [
            <c:forEach items="${listEm}" var="l" varStatus="status">
                "${l.getUsername()}"<c:if test="${!status.last}">, </c:if>
            </c:forEach>
                ];
                // Kiểm tra xem email đã tồn tại trong danh sách không
                if (existingEmails.includes(email)) {
                    alert('Email này đã tồn tại. Vui lòng chọn email khác.');
                    event.preventDefault(); // Ngăn không cho biểu mẫu được gửi đi
                } else if (existingUsernames.includes(username)) {
                    alert('Username này đã tồn tại. Vui lòng chọn username khác.');
                    event.preventDefault(); // Ngăn không cho biểu mẫu được gửi đi
                } else {
                    alert('Đã thêm một staff vui lòng kiểm tra email để lấy mật khẩu.');
                }
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
