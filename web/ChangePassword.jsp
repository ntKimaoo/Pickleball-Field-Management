<%-- 
    Document   : Profile.jsp
    Created on : Sep 25, 2024, 10:39:52 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile | Pickleball Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-body-tertiary rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><a href="profile">User profile</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3">John Smith</h5>
                                <p class="text-muted mb-1">Full Stack Developer</p>
                                <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                                <div class="d-flex justify-content-center mb-2">
                                    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary">Follow</button>
                                    <button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-primary ms-1">Message</button>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4 mb-lg-0">
                            <div class="card-body p-0">
                                <ul class="list-group list-group-flush rounded-3">
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fas fa-globe fa-lg text-warning"></i>
                                        <a class="mb-0" href="addfriend.jsp">Friend list</a>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fab fa-github fa-lg text-body"></i>
                                        <a class="mb-0" href="#">Booking field</a>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                        <a class="mb-0" href="#">Match history</a>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                        <a class="mb-0" href="#">Payment history</a>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                        <a class="mb-0" href="#">Reward point</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Username</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="username" value="${sessionScope.user.getUsername()}" disabled="">
                                    </div>
                                </div>
                                <hr>
                                <form method="post" action="changepassword">
                                    <div class="row" style="margin-bottom: 5px">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Old Password</p>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="password" name="password" required="" minlength="6">
                                        </div>
                                        
                                    </div>
                                    <div class="row" style="margin-bottom: 5px">
                                        <div class="col-sm-3">
                                            <p class="mb-0">New Password</p>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="password" name="newpassword" required="" minlength="6">
                                        </div>
                                        
                                    </div>
                                    <div class="row" >
                                        <div class="col-sm-3">
                                            <p class="mb-0">Re-enter new Password</p>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="password" name="repassword" required="" minlength="6">
                                        </div>
                                        <p style="font-size: 120%;display: flex;justify-content: center;color:red">${requestScope.error}</p>
                                    </div>
                                <hr>
                                 <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Nick Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="nickname" value="${requestScope.profile.getNickName()}" disabled="">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="fullname" value="${requestScope.profile.getFullName()}" disabled="">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="email" value="${requestScope.profile.getEmail()}" disabled="">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="phone" value="${requestScope.profile.getPhone()}" disabled="">
                                    </div>
                                </div>                    
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <input type="text" name="address" value="${requestScope.profile.getAddress()}" disabled="">
                                    </div>
                                </div>
                                     </div>
                                        <div class="row" style="margin-top: 5px;margin-bottom: 5px">
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-4">
                                            <input type="submit" value="Change Password">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body">
                                        <p class="mb-4" style="display: flex;justify-content: center"><span class="text-primary font-italic me-1"></span> Messages </p>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body">
                                        <p class="mb-4"><span class="text-primary font-italic me-1"></span> All Request </p>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>