<%-- 
    Document   : ForgotPassword
    Created on : Sep 12, 2024, 9:11:28 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Responsive Login Form </title>

        <!-- CSS -->
        <link rel="stylesheet" href="css/form_style.css">
                
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
                
        <style>
            .center{
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <section class="container forms">
            <div class="form login">
                <div class="form-content">
                    <header>Forgot password</header>
                    <h3><i class="fa fa-lock fa-4x center"></i></h3>
                     <p style="font-size: 120%;display: flex;justify-content: center;color:red">${requestScope.error}</p>
                    <form action="forgotpassword">
                        <div class="field input-field">
                            <input type="text" placeholder="Username" name="username" class="input">
                        </div>

                        <div class="field button-field">
                            <button>Reset your password</button>
                        </div>
                    </form>
            </div>
                <div class="form-link">
                            <a href="Login.jsp">Back to Login</a>
                        </div>
        </section>
 
        <script src="../eye_icon.js"></script>
    </body>
</html>