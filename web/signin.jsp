<%-- 
    Document   : login
    Created on : Oct 4, 2020, 3:28:14 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signin - YMS</title>
        <!--<link rel="stylesheet" href="css/login.css">-->
        <link href="https://getbootstrap.com/docs/4.5/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
        <style>
            body {
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <c:if test="${not empty user}">
            <c:redirect url="home"/>
        </c:if>
        <c:if test="${empty user}">
            <c:set value="${requestScope.LASTED_USERNAME}" var="username"/>
            <div class="container">
                <div class="signin-page col-md-4" style="margin: auto">
                    <div class="auth-form mt-4">
                        <div class="auth-form-header">
                            <h1><b style="color: var(--warning)">Moon Shop</b><br>Sign in</h1>
                        </div>
                        <c:set value="${requestScope.MSG_ERROR}" var="msg"/>
                        <c:set value="${requestScope.LASTED_EMAIL}" var="lastedEmail"/>
                        <c:if test="${not empty msg}">
                            <div class="alert alert-danger" role="alert">${msg}</div>
                        </c:if>
                        <div class="auth-form-body mt-3">
                            <form action="signIn" method="post">
                                <label for="username">Username</label>
                                <input type="text" id="email" name="username"  minlength="8"
                                       value="<c:if test="${not empty username}">${username}</c:if>"
                                           class="form-control input-block" required="true" autofocus>
                                       <label for="password">Password</label>
                                       <input type="password" id="password" name="password" 
                                              class="form-control input-block" minlength="8" required="true">
                                       <button type="submit" class="btn btn-primary btn-signin btn-block mt-4">Sign in</button>
                                </form>
                            </div>
                            <p class="create-account-callout mt-3">New to Moon Shop? <a href="signup.jsp">Create an account.</a></p>
                        </div>
                    </div>
                </div>
        </c:if>
    </body>
</html>
