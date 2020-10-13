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
        <title>My Cart - Yello Mooon Shop</title>
    </head>
    <body>
        <h1><a href="./">Home page</a></h1>
        <h1>My Cart</h1>
        <c:set value="${sessionScope.MY_CART}" var="myCart"/>
        <c:if test="${not empty myCart.items.entrySet()}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${myCart.getItems().entrySet()}" var="cart" varStatus="counter">
                        <c:set var="item" value="${cart.getKey()}" />
                        <tr>
                            <td>${counter.count}</td>
                            <td><img src="${item.img}" height="50" /> </td>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td>${cart.getValue()}</td>
                            <td>${cart.getValue() * item.price}</td>
                            <td>
                                <form action="removeItem" method="POST">
                                    <input type="hidden" name="cakeId" value="${item.id}"/>
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4"></td>
                        <td colspan="2">${myCart.totalAmount}</td>
                    </tr>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty myCart.items.entrySet()}">
            <p>Cart is empty! Shopping now</p>
        </c:if>
    </body>
</html>
