<%-- 
    Document   : createCake
    Created on : Oct 10, 2020, 4:03:29 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Cake - YMS</title>
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
        <link href="css/dashboard.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--Navigation Bar-->
        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-2 col-lg-1 mr-0 px-3" style="color: yellow" href="./"><b>Moon Shop</b></a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" 
                    type="button" data-toggle="collapse" data-target="#sidebarMenu" 
                    aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--            <input class="form-control form-control-dark w-100" type="text" 
                               placeholder="Search" aria-label="Search">-->
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <a class="nav-link" href="signOut">Sign out</a>
                </li>
            </ul>
        </nav>

        <!--Container-->
        <div class="container-fluid">
            <div class="row">
                <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-md-4">
                    <h2 class="pt-3 pb-2 mb-3">Create new Cake</h2>
                    <a class="btn btn-warning mb-4" href="./dashboard" role="button"><i class="fa fa-cog"></i> Products Management</a>
                    <div class="col-md-8 order-md-1">

                        <h4 class="mb-1">Cake information</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <c:set value="${requestScope.MSG_ERROR}" var="msg"/>
                                <c:if test="${not empty msg}">
                                    <div class="alert alert-alert" role="alert">${msg}</div>
                                </c:if>
                            </div>
                        </div>

                        <hr class="mb-2">

                        <form class="needs-validation" action="createCake" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="name">Name<b style="color: red">*</b></label>
                                    <input type="text" name="name" class="form-control" id="name" required="true">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="description">Description<b style="color: red">*</b></label>
                                <textarea type="text" name="description" class="form-control" id="description" required="true"></textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="file">Image<b style="color: red">*</b></label><br>
                                    <input type="file" onchange="readURL(this);" class="" id="file" required="true">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="previewImg">Preview Image</label><br>
                                    <input type="hidden" name="imageUrl" id="imgUrl" value="" />
                                    <img alt="Preview Image"  id="previewImg" height="100" src="https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-trang-vang-hong-ngoc-vang-kinh-do1.jpg" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="price">Price<b style="color: red">*</b> <span class="text-muted">(Min = 0)</span></label>
                                    <input type="number" name="price" required="true" min="0" max="999999999" class="form-control" id="price" >
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="quantity">Quantity<b style="color: red">*</b> <span class="text-muted">(Min = 0)</span></label>
                                    <input type="number" name="quantity" required="true" min="0" max="999999999" class="form-control" id="quantity" >
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="category">Category<b style="color: red">*</b></label>
                                    <select class="custom-select d-block w-100" name="category" id="category" required="true">
                                        <option value="">Choose...</option>
                                        <c:set value="${requestScope.LIST_CATEGORIES}" var="categories"/>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}">${category.name} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="createDate">Create Date<b style="color: red">*</b></label>
                                    <input type="date" name="createDate" class="form-control" id="createDate" required="true">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="expDate">Expiration Date<b style="color: red">*</b></label>
                                    <input type="date" name="expDate" class="form-control" id="expDate" required="true">
                                </div>
                            </div>
                            <p class="text-muted mb-2"><i class="fa fa-info-circle"></i> When creating the cake successful, the system will redirect to the Dashboard screen.</p>
                            <button class="btn btn-success mb-5" type="submit" onclick="return createCake()">Create this cake</button>
                            <button class="btn btn-secondary mb-5" type="reset">Reset input</button>
                        </form>
                    </div>
                </main>
            </div>

        </div>

    </body>
    <script>
        function createCake() {
            const createDate = new Date(document.getElementById("createDate").value);
            const expDate = new Date(document.getElementById("expDate").value);
            if (createDate >= expDate) {
                alert("The expiration date must be greater than create date. Please check again!");
                return false;
            } else {
                const cfm = confirm("Are you sure to create this cake?");
                return cfm;
            }
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    const imgId = "previewImg";
                    const inputImgId = "imgUrl";
                    const previewImg = document.getElementById(imgId);
                    const imgInput = document.getElementById(inputImgId);
                    imgInput.value = e.target.result;
                    previewImg.setAttribute("src", e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</html>
