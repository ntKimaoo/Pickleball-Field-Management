<%-- 
    Document   : Rank
    Created on : Oct 23, 2024, 9:13:00 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            :root {
                --rad: .7rem;
                --dur: .3s;
                --color-dark: #2f2f2f;
                --color-light: #fff;
                --color-brand: #57bd84;
                --font-fam: 'Lato', sans-serif;
                --height: 2rem; /* Adjusted height */
                --btn-width: 4rem; /* Adjusted button width */
                --bez: cubic-bezier(0, 0, 0.43, 1.49);
            }
            .col-sm-6 form {
                position: relative;
                width: 20rem; /* Adjusted width */
                background: var(--color-brand);
                border-radius: var(--rad);
                display: inline-block; /* Added to keep it inline */
                vertical-align: middle; /* Aligns with other elements */
                margin-right: 10px; /* Adds spacing if needed */
            }
            .col-sm-6 input, button {
                height: var(--height);
                font-family: var(--font-fam);
                border: 0;
                color: var(--color-dark);
                font-size: 1.5rem; /* Adjusted font size */
            }
            .col-sm-6 input[type="search"] {
                outline: 0;
                width: 100%;
                background: var(--color-light);
                padding: 0 1rem; /* Giữ khoảng cách */
                border-radius: var(--rad);
                appearance: none;
                transition: all var(--dur) var(--bez);
                transition-property: width, border-radius;
                z-index: 1;
                position: relative;
                font-size: 1rem; /* Thêm font-size nhỏ hơn */
            }

            .col-sm-6 button {
                display: none;
                position: absolute;
                top: 0;
                right: 0;
                width: var(--btn-width);
                font-weight: bold;
                background: var(--color-brand);
                border-radius: 0 var(--rad) var(--rad) 0;
            }
            .col-sm-6 input:not(:placeholder-shown) {
                border-radius: var(--rad) 0 0 var(--rad);
                width: calc(100% - var(--btn-width));
                + button {
                    display: block;
                }
            }
            .col-sm-6 label {
                position: absolute;
                clip: rect(1px, 1px, 1px, 1px);
                padding: 0;
                border: 0;
                height: 1px;
                width: 1px;
                overflow: hidden;
            }
        </style>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6" style="cursor: pointer" onclick="location.href='ShowRank'">
                                <h2>Manage <b>Ranks</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <form action="ShowRank" role="search">
                                    <label for="search">Search for stuff</label>
                                    <input id="search" type="search" name="searchName" placeholder="Search by name..." autofocus required />
                                    <button type="submit"><i class="material-icons">&#xE8B6;</i></button>    
                                </form>	
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Rank</span></a>						
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover sortable">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Min Point</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listRank}" var="r">
                                <tr>
                                    <td>${r.rank_id}</td>
                                    <td><img src="${r.img}" alt="Rank Image" width="75px" height="75px"/></td>
                                    <td>${r.rank_name}</td>
                                    <td>${r.min_point}</td>
                                    <td>
                                        <a href="#editEmployeeModal" class="edit" data-toggle="modal" data-id="${r.rank_id}" data-name="${r.rank_name}" data-img="${r.img}" data-point="${r.min_point}"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal" data-id="${r.rank_id}"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--                    <div class="clearfix">
                                            <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                            <ul class="pagination">
                                                <li class="page-item disabled"><a href="#">Previous</a></li>
                                                <li class="page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                            </ul>
                                        </div>-->
                </div>
            </div>        
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddRank" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Rank</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image URL</label>
                                <input type="text" name="img" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Min Point</label>
                                <input type="number" name="point" class="form-control" required>
                            </div>				
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="UpdateRank" method="post">
                        <input type="hidden" name="id" id="rankIdToUpdate">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Rank</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" id="nameToUpdate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image URL</label>
                                <input type="text" name="img" id="imgToUpdate" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Min Point</label>
                                <input type="number" name="point" id="pointToUpdate" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="DeleteRank" method="post">
                        <input type="hidden" name="id" id="rankIdToDelete">
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Rank</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <script>
            $('#deleteEmployeeModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Nút đã kích hoạt modal
                var rankId = button.data('id'); // Lấy ID từ thuộc tính data-id
                $(this).find('#rankIdToDelete').val(rankId); // Cập nhật trường ẩn với ID
            });

            $('#editEmployeeModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Nút đã kích hoạt modal
                var rankId = button.data('id'); // Lấy ID từ thuộc tính data-id
                var rankName = button.data('name');
                var rankPoint = button.data('point');
                var rankImg = button.data('img');
                $(this).find('#rankIdToUpdate').val(rankId); // Cập nhật trường ẩn với ID
                $(this).find('#imgToUpdate').val(rankImg);
                $(this).find('#pointToUpdate').val(rankPoint);
                $(this).find('#nameToUpdate').val(rankName);
            });
        </script>
    </body>
</html>