<%-- 
    Document   : signup
    Created on : Oct 4, 2020, 3:42:03 PM
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
        <h1>Register page</h1>
        <c:set value="${requestScope.MSG_ERROR}" var="msg"/>
        <c:set value="${requestScope.LASTED_USERNAME}" var="username"/>
        <c:set value="${requestScope.LASTED_FULL_NAME}" var="fullName"/>
        <c:set value="${requestScope.LASTED_PHONE}" var="phone"/>
        <c:if test="${not empty msg}">
            <p>${msg}</p>
        </c:if>
        <form action="signUp" method="post">
            <p>Username*</p>
            <input type="text" name="username" required="true" minlength="8"
                   value="<c:if test="${not empty username}">${username}</c:if>">
                   <p>Password*</p>
                   <input type="password" name="password" required="true" minlength="8">
                   <p>Confirm password*</p>
                   <input type="password" name="confirmPassword" required="true" minlength="8">
                   <p>Full name</p>
                   <input type="text" name="fullName"  required="true"
                          value="<c:if test="${not empty fullName}">${fullName}</c:if>">
                   <p>Phone</p>
                   <input type="tel" name="phone" required="true"
                          value="<c:if test="${not empty phone}">${phone}</c:if>">
            <input type="submit" name="action" value="signup">
            <input type="reset" value="reset">
        </form>
        <a href="signin.jsp">Login page</a>
    </body>

</html>