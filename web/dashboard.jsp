<%-- 
    Document   : dashboard
    Created on : Oct 4, 2020, 3:32:17 PM
    Author     : TriHuynh
--%>

<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
        <title>Dashboard - YMS</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
        <link href="css/dashboard.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .custom-file-label::after {
                content: "" !important;
                background-color: white;
                border-left: none;
            };
        </style>
    </head>
    <body>
        <!--Navigation Bar-->
        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-2 col-lg-1 mr-0 px-3" style="color: yellow" href="#"><b>Moon Shop</b></a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" 
                    type="button" data-toggle="collapse" data-target="#sidebarMenu" 
                    aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--            <input class="form-control form-control-dark w-100" type="text" 
                               placeholder="Search" aria-label="Search">-->
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <a class="nav-link" href="#">Sign out</a>
                </li>
            </ul>
        </nav>

        <!--Container-->
        <div class="container-fluid">
            <div class="row">

                <!--Side Bar Menu-->
                <%--<%@include file="component/sidebar.jspf" %>--%>

                <!--Main screen-->
                <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-md-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>

                    <h2 class="pt-3 pb-2 mb-3">Products Management</h2>
                    <a class="btn btn-primary mb-3" href="./dashboard" role="button"><i class="fa fa-refresh"></i> Refresh Data</a>
                    <div class="table-responsive">
                        <table class="table table-sm table-bordered table-hover">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th style="width:3%">#</th>
                                    <th style="width:15%">Name</th>
                                    <th style="width:10%">Image</th>
                                    <th style="width:10%">Price (đ)</th>
                                    <th style="width:15%">Category</th>
                                    <th style="width:7%">Quantity</th>
                                    <th style="width:10%">Created Date</th>
                                    <th style="width:10%">Expiration Date</th>
                                    <th style="width:8%">Status</th>
                                    <th style="width:5%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set value="${requestScope.LIST_CAKES}" var="cakes"/>
                                <c:set value="${requestScope.LIST_CATEGORIES}" var="categories"/>
                                <c:if test="${not empty cakes}">
                                    <c:forEach items="${cakes}" var="cake" varStatus="counter">
                                    <form action="updateCake" method="post">
                                        <tr class="text-center">
                                            <!--update cake-->
                                            <!--counter-->
                                            <td class="align-middle">
                                                <input type="hidden" value="${cake.id}" name="id" />
                                                <b>${counter.count}.</b>
                                            </td>
                                            <!--name-->
                                            <td class="align-middle">
                                                <textarea name="udtName" class="form-control" style="width: 100%; height: 100%">${cake.name}</textarea>
                                            </td>
                                            <!--image-->
                                            <td class="align-middle">
                                                <img class="bd-placeholder-img"  height="50" id="previewImg_${cake.id}" src="${cake.imageUrl}"/>
                                                <input type="hidden" name="udtImageUrl" id="imgUrl_${cake.id}" value="${cake.imageUrl}" />
                                                <br>
                                                <input type="file" onchange="readURL(this, ${cake.id});" style="display:none;" id="chooseFile_${cake.id}">
                                                <label for="chooseFile_${cake.id}" style="margin-bottom: 0;">Click to upload image</label>
                                            </td>
                                            <!--price-->
                                            <td class="align-middle">
                                                <input name="udtPrice" class="form-control" type="number"
                                                       min="10000" step="1000" max="999999999" value="${cake.price}" />
                                                <%--<fmt:setLocale value="vi_VN"/>--%>
                                                <%--<fmt:formatNumber value="${cake.price}" type="currency"/>--%>
                                            </td>
                                            <!--category-->
                                            <td class="align-middle">
                                                <select class="form-control" name="udtCategory" accesskey=""id="category">
                                                    <c:forEach items="${categories}" var="category">
                                                        <option value="${category.id}" 
                                                                <c:if test="${cake.categoryId.id == category.id}"> selected="true"</c:if>>
                                                            ${fn:toLowerCase(category.name)}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <!--quantity-->
                                            <td class="align-middle">
                                                <input class="form-control" type="number" 
                                                       name="udtQuantity" onkeypress="return event.charCode >= 48" 
                                                       min="0" max="999999999" value="${cake.quantity}" />
                                            </td>
                                            <!--create date-->
                                            <td class="align-middle">
                                                <input class="form-control" type="date" 
                                                       name="udtCreateDate"
                                                       value="<fmt:formatDate pattern="yyyy-MM-dd" value="${cake.createDate}" />" />
                                            </td>
                                            <!--exp date-->
                                            <td class="align-middle">
                                                <input class="form-control" type="date" 
                                                       name="udtExpDate"
                                                       value="<fmt:formatDate pattern="yyyy-MM-dd" value="${cake.expirationDate}" />" />
                                            </td>
                                            <!--status-->
                                            <td class="align-middle">
                                                <select class="form-control"  name="udtStatus" id="status">
                                                    <option value="true" <c:if test="${cake.isActive == true}">selected="true"</c:if>>Active</option>
                                                    <option value="false" <c:if test="${cake.isActive == false}">selected="true"</c:if>>Inactive</option>
                                                    </select>
                                                </td>
                                                <!--button-->
                                                <td class="align-middle">
                                                    <button class="btn btn-sm btn-warning" onclick="return updateCake()" type="submit">Update</button>
                                                </td>
                                            </tr>
                                        </form>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
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
                    </div>
                </main>
            </div>
            <script>
                function updateCake() {
                    const cfm = confirm("Are you sure to update this cake?");
                    return cfm;
                }
                function readURL(input, id) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            const imgId = "previewImg_" + id;
                            const inputImgId = "imgUrl_" + id;
                            const previewImg = document.getElementById(imgId);
                            const imgInput = document.getElementById(inputImgId);
                            imgInput.value = e.target.result;
                            previewImg.setAttribute("src", e.target.result);
                        };
                        reader.readAsDataURL(input.files[0]);
                    }
                }
            </script>
    </body>
</html>
