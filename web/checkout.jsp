<%-- 
    Document   : checkout
    Created on : Oct 13, 2020, 11:02:00 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout - Yellow Moon Shop</title>
    </head>
    <body>
        <h3><a href="./">Home page</a></h3>
        <h1>Checkout</h1>
        <c:set value="${sessionScope.MY_CART}" var="myCart"/>
        <c:if test="${not empty myCart.items.entrySet()}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${myCart.getItems().entrySet()}" var="cart" varStatus="counter">
                        <c:set var="item" value="${cart.getKey()}" />
                    <form action="updateItem" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td>${cart.getValue()}</td>
                        </tr>
                    </form>
                </c:forEach>
                <tr>
                    <td colspan="2"></td>
                    <td>Total Price:</td>
                    <td colspan="2">${myCart.totalAmount}</td>
                </tr>
            </tbody>
        </table>
    </c:if>
    <c:set value="${sessionScope.USER}" var="user"/>

    <form action="placeOrder" method="POST">
        <h3>Your information details:</h3>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="${user.fullName}" required="true"/></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input type="tel" name="phone" value="${user.phone}" required="true"/></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" value="${user.email}" required="true"/></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" value="${user.address}" required="true"/></td>
            </tr>
        </table>
        <h3>Payment method:</h3> 
        <input type="radio" id="cod" checked="true" name="payment" value="2">
        <label for="cod">Cash on Delivery</label><br>
        <input type="radio" id="paypal" name="payment" value="3">
        <label for="paypal">Paypal</label><br>
        <input type="radio" id="bank" name="payment" value="4">
        <label for="bank">Internet Banking</label>
        <br>
        <button type="submit">Place an Order</button>
    </form>
</body>
</html>
