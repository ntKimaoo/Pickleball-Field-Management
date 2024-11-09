<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Membership</div>
                            <ul >
                            <c:set var="cat" value="${listCC}" />
                            <c:set var="ci" value="${requestScope.cid}" />
                            <form action="check">
                            <c:forEach begin="0" end="${listCC.size()-1}" var="i">
                                
                                <input type="checkbox" name="id" value="${listCC.get(i).getCid()}"
                                       ${ci[i]?"checked":""}  />${listCC.get(i).getCname()}
                                <br/>
                                </c:forEach>
                              
                                <input type="submit" value="SEARCH">
                                </form>
                        </ul>
                    </div>
                            
                </div>

                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <c:if test="${o.amount>0}">
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="${o.image}" alt="Card image cap"
                                             style="height:350px">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="detail?pid=${o.ID}" title="View Product">${o.name}</a></h4>
                                            <p class="card-text show_txt">${o.title}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${o.price} $</p>
                                                </div>
                                                <c:if test="${sessionScope.acc !=null}">
                                                    <div class="col">
                                                        <a href="detail?pid=${o.ID}" class="btn btn-success btn-block">Add to cart</a>
                                                    </div>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="clearfix">

                    <c:if test="${check==1}">
                        <div class="hint-text">Showing <b>6</b> out of <b>${nb}</b> entries</div>
                        <ul class="pagination">
                            <c:if test="${pgi>1}">
                                <li class="page-item disabled"><a href="home?pg=${pgi-1}">Previous</a></li>
                                </c:if>
                                <c:forEach items="${page}" var="p">
                                <li class="page-item ${pgi==p.intValue()?"active":""}"><a href="home?pg=${p}" class="page-link">${p}</a></li>
                                </c:forEach>
                                <c:if test="${pgi<=nb/6-1}">
                                <li class="page-item"><a href="home?pg=${pgi+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>

                    </c:if>
                        <c:if test="${check==2}">
                             <div class="hint-text">Showing <b>6</b> out of <b>${nb}</b> entries</div>
                        <ul class="pagination">
                            <c:if test="${pgi>1}">
                                <li class="page-item disabled"><a href="category?cid=${CID}&pg=${pgi-1}">Previous</a></li>
                                </c:if>
                                <c:forEach items="${page}" var="p">
                                <li class="page-item ${pgi==p.intValue()?"active":""}"><a href="category?cid=${CID}&pg=${p}" class="page-link">${p}</a></li>
                                </c:forEach>
                                <c:if test="${pgi<=nb/6}">
                                <li class="page-item"><a href="category?cid=${CID}&pg=${pgi+1}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                        </c:if>
                             <c:if test="${check==3}">
                             <div class="hint-text">Showing <b>6</b> out of <b>${nb}</b> entries</div>
                        <ul class="pagination">
                            <c:if test="${pgi>1}">
                                <li class="page-item disabled"><a href="search?pg=${pgi-1}&txt=${txtS}">Previous</a></li>
                                </c:if>
                                <c:forEach items="${page}" var="p">
                                <li class="page-item ${pgi==p.intValue()?"active":""}"><a href="search?pg=${p}&txt=${txtS}" class="page-link">${p}</a></li>
                                </c:forEach>
                                <c:if test="${pgi<=nb/6}">
                                <li class="page-item"><a href="search?pg=${pgi+1}&txt=${txtS}" class="page-link">Next</a></li>
                                </c:if>
                        </ul>
                        </c:if>


                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <p class="mb-0">
                            Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Informations</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                        <h5>Others links</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><a href="">Link 1</a></li>
                            <li><a href="">Link 2</a></li>
                            <li><a href="">Link 3</a></li>
                            <li><a href="">Link 4</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home mr-2"></i> My company</li>
                            <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                            <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                            <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                        </ul>
                    </div>
                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>
                        </p>
                        <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a> | <span>v. 1.0</span></p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>

