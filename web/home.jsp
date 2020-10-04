<%-- 
    Document   : home
    Created on : Oct 4, 2020, 3:30:49 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Home page</h1>
        <c:set value="${sessionScope.USER}" var="user"/>
        <c:if test="${not empty user}">
            <p>Hi ${user.fullName}!</p>
        </c:if>
        <c:if test="${empty user}">
            <a href="signin.jsp">Sign In here!</a>
        </c:if>

        <form action="search" method="get">
            <label for="keyword">Keyword:</label>
            <input type="text" id="keyword" name="keyword" required="true"/>
            <label for="min">Min price:</label>
            <input type="number" id="min" name="min" min="10000" max="1000000" required="true" value="10000">
            <label for="max">Max price:</label>
            <input type="number" id="max" name="max" min="10000" max="1000000" required="true" value="900000">
            <label for="category">Category:</label>
            <c:set value="${requestScope.LIST_CATEGORIES}" var="categories"/>
            <c:if test="${not empty categories}">
                <select name="category" id="category">
                    <c:forEach items="${categories}" var="cate">
                        <option value="${cate.id}">${cate.name}</option>
                    </c:forEach>
                </select>
            </c:if>
            <input type="submit" value="Search"/>
        </form>
        <br/>

        <c:set value="${requestScope.LIST_CAKES}" var="cakes"/>
        <c:if test="${not empty cakes}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Cake ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cakes}" var="cake">
                        <tr>
                            <td>${cake.id}</td>
                            <td>${cake.name}</td>
                            <td>${cake.price}</td>
                            <td>${cake.quantity}</td>
                            <!--<td>${cake.imageUrl}</td>-->
                            <td><button>Chọn mua</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty cakes}">
            <p>No cakes was found!</p>
        </c:if>
    </body>
</html>
