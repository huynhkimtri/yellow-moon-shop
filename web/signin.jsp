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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <c:set var="user" value="${sessionScope.USER}"/>
        <c:if test="${not empty user}">
            <c:redirect url="home"/>
        </c:if>
        <c:if test="${empty user}">
            <c:set value="${requestScope.LASTED_USERNAME}" var="username"/>
            <form action="signIn" method="post">
                <input type="text" name="username" required="true" minlength="8"
                       value="<c:if test="${not empty username}">${username}</c:if>">
                       <input type="password" name="password" required="true" minlength="8">
                       <input type="submit" name="action" value="signin"> 
                </form>
                <a href="signup.jsp">Register page</a>
            <c:set var="msg" value="${requestScope.MSG_ERROR}"/>
            <c:if test="${not empty msg}">
                <p>${msg}</p>
            </c:if>
        </c:if>
    </body>
</html>
