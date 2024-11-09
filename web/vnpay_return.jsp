<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.vnpay.common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
           

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label>${vnp_TxnRef}</label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label>${vnp_Amount}</label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label>${vnp_OrderInfo}</label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label>${vnp_ResponseCode}</label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label>${vnp_TransactionNo}</label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label>${vnp_BankCode}</label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label>${vnp_PayDate}</label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        ${vnp_TransactionStatus}</label>
                </div> 
            </div>
                <div class="container">
            <button type="button" class="btn btn-primary" onclick="window.location.href='home'">Về Trang Chủ</button>
        </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
              
            </footer>
        </div>  
    </body>
</html>
