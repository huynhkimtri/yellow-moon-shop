<%-- 
    Document   : myCart
    Created on : Oct 5, 2020, 12:40:26 AM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart - Yellow Moon Shop</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
            <div class="container-xl">
                <a class="navbar-brand" href="./">Moon Shop</a>
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
        <c:set value="${sessionScope.USER}" var="user"/>
        <c:if test="${not empty user and user.roleId.id == 1}">
            <c:redirect url="./"/>
        </c:if>
        <section class="mt-5 pt-5 pb-5">
            <div class="container">
                <div class="row w-100">
                    <div class="col-lg-12 col-md-12 col-12">
                        <h3 class="display-5 mb-2 text-center mb-5">Shopping Cart</h3>
                        <c:set value="${sessionScope.MY_CART}" var="myCart"/>
                        <c:if test="${not empty myCart.items.entrySet()}">
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
                                    <c:forEach items="${myCart.getItems().entrySet()}" var="cart" varStatus="counter">
                                        <c:set var="item" value="${cart.getKey()}" />
                                    <form action="updateItem" method="POST">
                                        <tr>
                                            <td data-th="Cake">
                                                <div class="row">
                                                    <div class="col-md-3 text-left">
                                                        <img src="${item.img}"  alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                                    </div>
                                                    <div class="col-md-9 text-left mt-sm-2">
                                                        <h5>${item.name}</h5>
                                                        <p class="font-weight-light">Brand &amp; Name</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td data-th="Price"><h5>${item.price}</h5></td>
                                            <td data-th="Quantity">
                                                <input type="number" class="form-control form-control-lg text-center" 
                                                       name="quantity" min="1" max="99" onKeyDown="return false" 
                                                       onchange="setValueQuantity(this.value)" value="${cart.getValue()}" />

                                            </td>
                                            <td data-th="Total"><h5>${cart.getValue() * item.price}</h5></td>
                                            <td class="actions" data-th="">
                                                <div class="text-right">
                                                    <input type="hidden" name="cakeId" value="${item.id}"/>
                                                    <button class="btn btn-sm btn-success" type="submit">Update</button>
                                                    <button class="btn btn-sm btn-danger" 
                                                            type="button" onclick="removeItem(${item.id})">
                                                        Remove
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="float-right text-right">
                                <h4>Total amount:</h4>
                                <h3>${myCart.totalAmount} VND</h3>
                            </div>

                        </div>
                    </div>
                    <div class="row mt-4 d-flex align-items-center">
                        <div class="col-sm-6 order-md-2 text-right">
                            <a href="checkout.jsp" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">Confirm</a>
                        </div>
                        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
                            <a href="home">Continue Shopping</a>
                        </div>
                    </div>
                </c:if>

                <c:if test="${empty myCart.items.entrySet()}">
                    <p>Cart is empty! Shopping now</p>
                </c:if>
            </div>
        </section>

    </body>
    <script>
        const removeItem = function (id) {
            const url = new URL(this.document.URL);
            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    document.location.reload();
                }
            };
            const uri = "http://localhost:8080/YellowMoonShop/removeItem?cakeId=" + id;
            const cfm = confirm("Are you sure to remove this item?");
            if (cfm) {
                xhttp.open("POST", uri, true);
                xhttp.send();
            }
        };
        const setValueQuantity = function (value) {
            const quantity = document.getElementById("hdnQuantityItem");
            quantity.value = value;
        };
    </script>
</html>
