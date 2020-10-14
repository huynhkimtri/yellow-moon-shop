<%-- 
    Document   : tracking
    Created on : Oct 13, 2020, 11:48:07 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracking Order - Yellow Moon Shop</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
            <div class="container-xl">
                <a class="navbar-brand" href="./">Moon Shop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07XL" aria-controls="navbarsExample07XL" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07XL">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="myCart.jsp">My Cart</a>
                        </li>
                        <li class="nav-item active">
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
        <c:set value="${sessionScope.USER}" var="user"/>
        <c:if test="${empty user}">
            <c:redirect url="signin.jsp"/>
        </c:if>

        <c:set value="${requestScope.ORDER}" var="order"/>
        <c:set value="${requestScope.ORDER_DETAILS}" var="details"/>
        <section class="mt-5 pt-5 pb-5">
            <div class="container">

                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 mb-2 text-center mb-5">Tracking order</h3>
                        <form class="form-inline mb-4" action="trackOrder" method="GET">
                            <input class="form-control col-md-3 mr-4" type="text" placeholder="Type order id here..." name="orderId"/>
                            <button class="btn  btn-primary" type="submit">Search</button>
                        </form>
                        <c:if test="${not empty details && not empty details}">
                            <table id="shoppingCart" class="table table-condensed table-responsive">
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width:50%">Cake</th>
                                        <th style="width:10%">Price</th>
                                        <th style="width:10%">Quantity</th>
                                        <th style="width:12%">Total</th>
                                        <th style="width:16%"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${details}" var="item" varStatus="counter">
                                    <form action="updateItem" method="POST">
                                        <tr>
                                            <td data-th="Cake">
                                                <div class="row">
                                                    <div class="col-md-3 text-left">
                                                        <img src="${item.cakeId.imageUrl}"  alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                                    </div>
                                                    <div class="col-md-9 text-left mt-sm-2">
                                                        <h5>${item.cakeId.name}</h5>
                                                        <p class="font-weight-light">Brand &amp; Name</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td data-th="Price"><h5>${item.singlePrice}</h5></td>
                                            <td data-th="Quantity">
                                                ${item.quantity}
                                            </td>
                                            <td data-th="Total"><h5>${item.singlePrice * item.quantity}</h5></td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="float-right text-right">
                                <h4>Total amount:</h4>
                                <h3>${order.amount} VND</h3>
                            </div>

                        </div>
                    </div>
                </c:if>
            </div>
        </section>
        <c:if test="${empty details}">
            <p>No order was found!</p>
        </c:if>
    </body>
</html>
