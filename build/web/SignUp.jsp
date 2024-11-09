
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/stylelogin.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body class="img js-fullheight" style="background-image: url(images/backgrounddark.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <img src="images/logo.png" class="heading-section" style="width: 45%" alt="alt"/>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">SIGN UP</h3>
                            <p style="font-size: 120%;display: flex;justify-content: center;color:red">${requestScope.error}</p>
                            <form action="signup" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="username" value="${username}" placeholder="Username*" required>
                                </div>  
                                <div class="form-group">
                                    <input id="password-field" type="password" name="password"  class="form-control" placeholder="Password*" minlength="6" required>
                                    <i class='bx bx-hide eye-icon' onclick="togglePasswordVisibility('password-field', this)"></i>
                                </div>
                                <div class="form-group">
                                    <input id="repassword-field" type="password" name="repassword" class="form-control" placeholder="Re-password" minlength="6" required>
                                    <i class='bx bx-hide eye-icon' onclick="togglePasswordVisibility('repassword-field', this)"></i>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="nickname" value="${nickname}" placeholder="NickName*" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="fullname" value="${fullname}" placeholder="FullName*" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="email" value="${email}" placeholder="Email*" required>
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control" name="phone" value="${phone}" placeholder="Phone" minlength="10" pattern="[0-9]*" maxlength="11" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="address" value="${address}" placeholder="Address">
                                </div>
                                
                                <div class="form-group"><input type="checkbox" name="term" value="yes">As press sign up, You totally agree with our <a style="text-decoration: none" href="#">Term of Agreement</a>
                                        </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
                                </div>
                                <div class="form-group">
                                    Or if you already have an account?<br>
                                    <a href="Login.jsp"> Return to Login</a>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
         <script>function togglePasswordVisibility(fieldId, iconElement) {
    var passwordInput = document.getElementById(fieldId); // Nhận trường mật khẩu theo ID
    var toggleIcon = iconElement; // Biểu tượng mắt được truyền vào hàm

    // Toggle thuộc tính type
    if (passwordInput.type === "password") {
        passwordInput.type = "text"; // Hiển thị mật khẩu
        toggleIcon.classList.remove("bx-hide");
        toggleIcon.classList.add("bx-show"); // Đổi biểu tượng thành 'show'
    } else {
        passwordInput.type = "password"; // Ẩn mật khẩu
        toggleIcon.classList.remove("bx-show");
        toggleIcon.classList.add("bx-hide"); // Đổi lại biểu tượng thành 'hide'
    }
}</script>
    </body>
</html>


