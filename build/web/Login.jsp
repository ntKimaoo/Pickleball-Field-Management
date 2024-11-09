

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
    <body class="img js-fullheight" style="opacity: 100%;background-image: url(images/backgrounddark.jpg);">
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
                            <h3 class="mb-4 text-center">SIGN IN</h3>
                            <p style="font-size: 120%;display: flex;justify-content: center;color:red">${requestScope.error}</p>
                            <form action="login" method="post" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" name="username" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Password" name="password" required>
                                    <i class='bx bx-hide eye-icon' onclick="togglePasswordVisibility()"></i>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <a href="SignUp.jsp" style="color: #fff">Sign Up</a>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="ForgotPassword.jsp" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8078/SWP391PickleballField/loginGG&response_type=code&client_id=501522888083-pla62endcu4tn985cqsllgrglaqn33re.apps.googleusercontent.com&approval_prompt=force"
                                   class="px-2 py-2 mr-md-1 rounded"><i style='font-size:24px' class='fab'>&#xf0d5;</i> Google</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script>function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password-field"); // Get the password field
    var toggleIcon = document.querySelector(".eye-icon"); // Get the icon element

    // Toggle the type attribute
    if (passwordInput.type === "password") {
        passwordInput.type = "text"; // Show the password
        toggleIcon.classList.remove("bx-hide");
        toggleIcon.classList.add("bx-show"); // Switch to 'show' icon
    } else {
        passwordInput.type = "password"; // Hide the password
        toggleIcon.classList.remove("bx-show");
        toggleIcon.classList.add("bx-hide"); // Switch back to 'hide' icon
    }
}</script>
    </body>
</html>


