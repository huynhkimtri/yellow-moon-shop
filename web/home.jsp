<%-- 
    Document   : home
    Created on : Oct 4, 2020, 3:30:49 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom shadow-sm">
            <div class="container-xl">
                <a class="navbar-brand" href="./">Moon Shop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07XL" aria-controls="navbarsExample07XL" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07XL">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="myCart.jsp">My Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="tracking.jsp" >Tracking Order</a>
                        </li>
                        <c:set value="${sessionScope.USER}" var="user"/>
                        <c:if test="${not empty user}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Hello, ${user.fullName}</a>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
        </nav>
        <section class="jumbotron text-center">
            <div class="container">
                <form action="search" method="get">
                    <label for="keyword">Keyword:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword"
                           value="${requestScope.KEYWORD}"/>

                    <label for="min">Min price:</label>
                    <input type="number" class="form-control" id="min" name="min" min="10000" max="1000000" 
                           required="true" value="${requestScope.MIN}"/>

                    <label for="max">Max price:</label>
                    <input type="number" class="form-control" id="max" name="max" min="10000" max="1000000" 
                           required="true" value="${requestScope.MAX}">

                    <label for="category">Category:</label>
                    <c:set value="${requestScope.LIST_CATEGORIES}" var="categories"/>
                    <c:if test="${not empty categories}">
                        <select name="category" class="form-control" id="category">
                            <option value="0">-- Select one --</option>
                            <c:forEach items="${categories}" var="cate">
                                <option value="${cate.id}" 
                                        <c:if test="${requestScope.CATEGORY == cate.id}"> selected="true"</c:if>>
                                    ${cate.name}
                                </option>
                            </c:forEach>
                        </select>
                    </c:if>
                    <button class="btn btn-primary btn-lg btn-block" type="submit">Search for cake</button>
                </form>
            </div>
        </section>
        <div class="container">
            <div class="album py-5 bg-light">
                <div class="container">
                    <c:set value="${requestScope.LIST_CAKES}" var="cakes"/>
                    <c:if test="${not empty cakes}">
                        <div class="row">
                            <c:forEach items="${cakes}" var="cake">

                                <div class="col-md-4">
                                    <div class="card mb-4 shadow-sm">
                                        <img class="bd-placeholder-img card-img-top" src="${cake.imageUrl}"/>
                                        <div class="card-body">
                                            <span class="badge badge-warning">${cake.categoryId.name}</span>
                                            <h5 class="card-title">${cake.name} - ${cake.price} VND</h5>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group">
                                                    <form action="addToCart" method="POST">
                                                        <c:set var="urlParams" value="${requestScope['javax.servlet.forward.query_string']}"/>
                                                        <input type="hidden" name="cakeId" value="${cake.id}"/>
                                                        <input type="hidden" name="cakeName" value="${cake.name}"/>
                                                        <input type="hidden" name="urlParams" value="${urlParams}"/>
                                                        <button type="submit" class="btn btn-sm btn-success">Add to Cart</button>
                                                    </form>
                                                </div>
                                                <small class="text-muted">Stock: ${cake.quantity}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${empty cakes}">
                        <p>No cakes was found!</p>
                    </c:if>
                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">Yellow Moon Shop - ©2020 - Power by TriHK</p>
            </footer>
        </div>
    </body>
</html>
