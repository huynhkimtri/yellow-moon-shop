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
        <c:set value="${sessionScope.USER}" var="user"/>
        <c:if test="${not empty user and user.roleId.id == 1}">
            <c:redirect url="./"/>
        </c:if>
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
                    <form action="updateItem" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td><img src="${item.img}" height="50" /> </td>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td>
                                <input type="number" name="quantity" min="1" max="99" onKeyDown="return false" 
                                       onchange="setValueQuantity(this.value)" value="${cart.getValue()}" />
                            </td>
                            <td>${cart.getValue() * item.price}</td>
                            <td>
                                <input type="hidden" name="cakeId" value="${item.id}"/>
                                <button type="submit">Update</button>
                                <button type="button" onclick="removeItem(${item.id})">Remove</button>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                <tr>
                    <td colspan="4"></td>
                    <td>Total Price:</td>
                    <td>${myCart.totalAmount}</td>
                    <td><a href="checkout.jsp"><button>Confirm</button></a></td>
                </tr>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty myCart.items.entrySet()}">
        <p>Cart is empty! Shopping now</p>
    </c:if>
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
