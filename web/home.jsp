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
        <title>Home - YMS</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <c:set value="${sessionScope.USER}" var="user"/>
    <c:if test="${not empty user and user.roleId.id eq 1}">
        <c:redirect url="dashboard"/>
    </c:if>
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
        <section class="jumbotron" style="padding: 2rem !important">
            <div class="container">
                <form action="search" method="get">
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <label for="keyword">Keyword:</label>
                            <input type="text" class="form-control" id="keyword" name="keyword"
                                   value="${requestScope.KEYWORD}"/>
                        </div>
                        <div class="col-md-3">
                            <label for="min">Min price:</label>
                            <input type="number" class="form-control" id="min" name="min" min="0" max="999999999" 
                                   required="true" value="${requestScope.MIN}"/>
                        </div>
                        <div class="col-md-3">
                            <label for="max">Max price:</label>
                            <input type="number" class="form-control" id="max" name="max" min="0" max="999999999" 
                                   required="true" value="${requestScope.MAX}">
                        </div>
                        <div class="col-md-3">
                            <label for="category">Category:</label>
                            <c:set value="${requestScope.LIST_CATEGORIES}" var="categories"/>
                            <c:if test="${not empty categories}">
                                <select name="category" class="form-control" id="category">
                                    <option value="0">Select ...</option>
                                    <c:forEach items="${categories}" var="cate">
                                        <option value="${cate.id}" 
                                                <c:if test="${requestScope.CATEGORY == cate.id}"> selected="true"</c:if>>
                                            ${cate.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </c:if>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit">Search for cake</button>
                    <button class="btn btn-secondary" type="reset">Reset search value</button>
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
                                        <img class="bd-placeholder-img card-img-top" height="256" src="${cake.imageUrl}"/>
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
                                                        <c:if test="${cake.quantity > 0}">
                                                            <input type="hidden" name="queryString" value="${requestScope['javax.servlet.forward.query_string']}"/>
                                                            <button type="submit" class="btn btn-sm btn-success">Add to Cart</button>
                                                        </c:if>
                                                        <c:if test="${cake.quantity <= 0}">
                                                            <button type="button" class="btn btn-sm btn-secondary">Contact later</button>
                                                        </c:if>
                                                    </form>
                                                </div>
                                                <c:if test="${cake.quantity > 0}">
                                                    <span class="badge badge-primary">Stock: ${cake.quantity}</span>
                                                </c:if>
                                                <c:if test="${cake.quantity <= 0}">
                                                    <span class="badge badge-dark">Out of Stock</span>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- Pagination -->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-template d-flex justify-content-center">
                                <c:set value="${requestScope.PAGE_NUMBER}" var="pageNummber" />
                                <c:set value="${requestScope.NUMBER_OF_PAGES}" var="numOfPages" />
                                <c:set value="${requestScope.CURRENT_PAGE}" var="currentPage" />
                                <c:forEach begin="1" end="${numOfPages}" step="1" varStatus="theCount">
                                    <li class="page-item <c:if test="${currentPage eq theCount.count}">active</c:if>">
                                            <a class="page-link" 
                                               href="search?keyword=${requestScope.KEYWORD}&min=${requestScope.MIN}&max=${requestScope.MAX}&category=${requestScope.CATEGORY}&page=${theCount.count}">
                                            ${theCount.count}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
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
