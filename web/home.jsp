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
        <title>Home Page</title>
    </head>
    <body>
        <h1><a href="./">Home page</a></h1>

        <h3><a href="myCart.jsp">My Cart</a></h3>

        <c:set value="${sessionScope.USER}" var="user"/>

        <c:if test="${not empty user}">
            <p>Hi ${user.fullName}!</p>
        </c:if>

        <form action="search" method="get">
            <label for="keyword">Keyword:</label>
            <input type="text" id="keyword" name="keyword"
                   value="${requestScope.KEYWORD}"/>

            <label for="min">Min price:</label>
            <input type="number" id="min" name="min" min="10000" max="1000000" 
                   required="true" value="${requestScope.MIN}"/>

            <label for="max">Max price:</label>
            <input type="number" id="max" name="max" min="10000" max="1000000" 
                   required="true" value="${requestScope.MAX}">

            <label for="category">Category:</label>
            <c:set value="${requestScope.LIST_CATEGORIES}" var="categories"/>
            <c:if test="${not empty categories}">
                <select name="category" id="category">
                    <option value="0">-- Select one --</option>
                    <c:forEach items="${categories}" var="cate">
                        <option value="${cate.id}" 
                                <c:if test="${requestScope.CATEGORY == cate.id}"> selected="true"</c:if>>
                            ${cate.name}
                        </option>
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
                        <th>Category</th>
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
                            <td>${cake.categoryId.name}</td>
                            <td><img src="${cake.imageUrl}" height="50" /> </td>
                            <td>
                                <form action="addToCart" method="POST">
                                    <c:set var="urlParams" value="${requestScope['javax.servlet.forward.query_string']}"/>
                                    <input type="hidden" name="cakeId" value="${cake.id}"/>
                                    <input type="hidden" name="cakeName" value="${cake.name}"/>
                                    <input type="hidden" name="urlParams" value="${urlParams}"/>
                                    <button type="submit">Add to Cart</button>
                                </form>
                            </td>
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
