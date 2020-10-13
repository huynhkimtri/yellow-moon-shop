<%-- 
    Document   : createCake
    Created on : Oct 10, 2020, 4:03:29 PM
    Author     : TriHuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Cake - Yellow Moon Shop</title>
    </head>
    <body>
        <form action="createCake" method="POST">
            <input type="text" name="txtName" required="true">
            <input type="text" name="txtImageUrl" required="true">
            <input type="text" name="txtDescription" required="true">
            <input type="number" name="txtPrice" required="true">
            <input type="number" name="txtQuantity" required="true">
            <input type="text" name="txtDate" required="true">
            <input type="text" name="txtName" required="true">
            <button type="submit" value="Submit"/>
        </form>
    </body>
</html>
