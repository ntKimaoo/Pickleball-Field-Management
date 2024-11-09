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
                        <h1>User List</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div style="display: flex; align-items: center; justify-content: space-between">
                            <div style="display: flex;">
                                <div class="head" style="margin-right: 20px">
                                    <select id="categorySelect">
                                        <option value="all">All User</option>
                                        <option value="customer"
                                                <c:if test="${filterRole=='customer'}">selected=""</c:if>>Customer</option>
                                                <option value="admin"
                                                <c:if test="${filterRole=='admin'}">selected=""</c:if>>Admin</option>
                                        </select>
                                    </div>
                                    <div class="head" style="margin-right: 20px">
                                        <select id="statusSelect">
                                            <option value="allstatus"
                                            <c:if test="${filterStatus=='allstatus'}">selected=""</c:if>>All</option>
                                            <option value="active"
                                            <c:if test="${filterStatus=='active'}">selected=""</c:if>>Active</option>
                                            <option value="inactive"
                                            <c:if test="${filterStatus=='inactive'}">selected=""</c:if>>Inactive</option>
                                        </select>
                                    </div>
                                    <div class="head" style="margin-right: 20px">
                                        <form action="searchuser">
                                            <input type="search" placeholder="Search..." name="keyword">
                                            <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="head">
                                    <a href="addnewuser" style="background-color: #00aced;color: white;padding: 3px;border-radius: 10px">
                                        <i class='bx bxs-cloud-download' ></i>
                                        <span>Add new user</span>
                                    </a>
                                </div>
                            </div>
                            <table>
                                <thead> 
                                    <tr>
                                        <th>Id</th>
                                        <th>Full Name</th>
                                        <th>Username</th>
                                        <!--                                    <th>Image</th>-->
                                        <th>Email</th>
                                        <th>Nickname</th>
                                        <th>Phone Number</th>
                                        <th>Role</th>
                                        <th>Point</th>
                                        <th>Status</th>
                                        <th>Online</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${listUser != null}">
                                    <c:forEach var="s" items="${listUser}">
                                        <tr>
                                            <td>${s.id}</td>
                                            <td>${s.getFullName()}</td>
                                            <td>${s.username}</td>
                                            <td>${s.getEmail()}</td>
                                            <td>${s.getNickName()}</td>
                                            <td>${s.getPhone()}</td>
                                            <td>${s.role}</td>
                                            <td>${s.point}</td>
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
                                                <a href="editacc?id=${s.id}">Edit</a> |
                                                <c:if test="${s.isActived==true}">
                                                    <a href="deactiveacc?id=${s.id}">Disable</a></c:if>
                                                <c:if test="${s.isActived==false}">
                                                    <a href="activeacc?id=${s.id}">Enable</a></c:if>
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
                                    <a href="usermanagement?index=${pageIndex-1}" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="usermanagement?index=${i}">${i}</a></li>
                                </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="usermanagement?index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>
                    <!-- phan trang role -->
                    <c:if test="${filterRole!=null&&filterStatus==null}">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageIndex==1}">
                                    <a class="disabled" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                                <c:if test="${pageIndex>1}">
                                    <a href="filteruser?category=${filterRole}&index=${pageIndex-1}" aria-disabled="true">
                                    Previous</a>
                                </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="filteruser?category=${filterRole}&index=${i}">${i}</a></li>
                            </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="filteruser?category=${filterRole}&index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>
                    <!-- phan trang status -->
                    <c:if test="${filterStatus!=null&&filterRole==null}">
                        <ul class="pagination">
                            <li>
                                <c:if test="${pageIndex==1}">
                                    <a class="disabled" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                                    <c:if test="${pageIndex>1}">
                                    <a href="filterStatus?status=${filterStatus}&index=${pageIndex-1}" aria-disabled="true">
                                        Previous</a>
                                    </c:if>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                                <li><a class="${pageIndex==i ? "active":""}" href="filterStatus?status=${filterStatus}&index=${i}">${i}</a></li>
                                </c:forEach>
                            <li>
                                <c:if test="${pageIndex<endP}">
                                    <a class="page-link" href="filterStatus?status=${filterStatus}&index=${pageIndex+1}">Next</a>
                                </c:if>
                                <c:if test="${pageIndex==endP}">
                                    <a class="disabled">Next</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:if>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->
        <script src="script.js"></script>
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
