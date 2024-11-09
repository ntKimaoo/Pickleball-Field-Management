<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        
        table {
            width: 50%; 
            margin: auto;
        }
        th, td {
            text-align: center;
            padding: 8px; 
            font-size: 14px; 
        }
      
        .id {
            width: 10%;
        }
        
        .date, .amount, .type {
            width: 30%;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-3 text-center">Transaction History</h2>
        
        <!-- Form to filter transactions by date -->
        <!-- Form to filter transactions by date and type -->
<form class="row g-3 justify-content-center align-items-end" method="post" action="transactionhistory">
    <div class="col-md-3">
        <label for="fromDate" class="form-label">From:</label>
        <input type="date" class="form-control" id="fromDate" name="fromDate">
    </div>
    <div class="col-md-3">
        <label for="toDate" class="form-label">To:</label>
        <input type="date" class="form-control" id="toDate" name="toDate">
    </div>
    <div class="col-md-2">
        <button type="submit" class="btn btn-primary">View</button>
    </div>
    <div class="col-md-2">
        <label for="type" class="form-label">Type:</label>
        <select name="type" id="type" class="form-select" onchange="this.form.submit()">
            <option ${type == "0" ? "selected" : ""} value="0">All Type</option>
            <option ${type == "point" ? "selected" : ""} value="point">Point</option>
            <option  ${type == "membership" ? "selected" : ""} value="membership">Membership</option>
        </select>
    </div>
</form>

        
        <!-- Transaction table -->
        <table class="table table-bordered mt-4">
            <thead class="table-primary">
                <tr>
                    <th scope="col" class="id">ID</th>
                    <th scope="col" class="date">Date</th>
                    <th scope="col" class="amount">Amount</th>
                    <th scope="col" class="type">Type</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listH}" var="transaction" varStatus="status">
                    <tr>
                        <td class="id">${status.index + 1}</td>
                        <td class="date">${transaction.date}</td>
                        <td class="amount">${transaction.amount}</td>
                        <td class="type">${transaction.type}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listH}">
                    <tr>
                        <td colspan="4" class="text-center">Không có giao dịch nào.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        
    </div>
</body>
</html>
