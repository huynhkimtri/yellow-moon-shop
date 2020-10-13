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
    </head>
    <body>
        <h1><a href="./">Home page</a></h1>
        <h1>Tracking Order</h1>
        <c:set value="${sessionScope.USER}" var="user"/>
        <c:if test="${empty user}">
            <c:redirect url="signin.jsp"/>
        </c:if>
        <form action="trackOrder" method="GET">
            <input type="text" name="orderId"/>
            <button type="submit">Search</button>
        </form>
        <c:set value="${requestScope.ORDER}" var="order"/>
        <c:set value="${requestScope.ORDER_DETAILS}" var="details"/>
        <c:if test="${not empty details && not empty details}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${myCart.getItems().entrySet()}" var="cart" varStatus="counter">
                        <c:set var="item" value="${cart.getKey()}" />
                    <form action="updateItem" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td><img src="${item.img}" height="50" /> </td>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td> ${cart.getValue()}</td>
                            <td>${cart.getValue() * item.price}</td>

                        </tr>
                    </form>
                </c:forEach>
                <tr>
                    <td colspan="4"></td>
                    <td>Total Price:</td>
                    <td>${myCart.totalAmount}</td>
                </tr>
            </tbody>
        </table>
    </c:if>
</body>
</html>
