<%-- 
    Document   : checkout
    Created on : Oct 13, 2020, 11:02:00 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout - YMS</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>

        <fmt:setLocale value="vi_VN"/>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark flex-md-nowrap shadow">
            <div class="container-xl">
                <a class="navbar-brand" style="color: var(--warning)" href="./"><b>Moon Shop</b></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07XL" aria-controls="navbarsExample07XL" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07XL">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="./">Home </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="myCart.jsp">My Cart <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="tracking.jsp" >Tracking Order</a>
                        </li>

                        <c:set value="${sessionScope.USER}" var="user"/>
                        <c:if test="${not empty user}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Hello, ${user.fullName}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signOut">Sign out</a>
                            </li>
                        </c:if>
                        <c:if test="${empty user}">
                            <li class="nav-item">
                                <a class="btn btn-primary" href="signup.jsp">Register</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-outline-primary" href="signin.jsp">Sign in</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="mt-5 pb-5">
            <div class="container">

                <c:set value="${sessionScope.USER}" var="user"/>
                <c:if test="${not empty user and user.roleId.id == 1}">
                    <c:redirect url="./"/>
                </c:if>
                <h3 class="mb-4">Checkout Result</h3>

                <c:set value="${requestScope.MY_ORDER}" var="myOrder"/>
                <c:if test="${not empty myOrder}">
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Well done!</h4>
                        <p>Aww yeah, your order has been placed successfully!</p>
                        <hr>
                        <p class="mb-0">Your can tracking your order <a href="./trackOrder?orderId=${myOrder.id}" class="alert-link">here</a>. Thank you!</p>
                    </div>
                </c:if>

            </div>
        </section>
    </body>
</html>
