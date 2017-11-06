<%-- 
    Document   : delete
    Created on : Apr 22, 2011, 3:55:55 PM
    Author     : FMilens
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Person</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
    </head>
    <body>
        <h1>Delete Person</h1>
        <p>You are about to delete the person ${person.firstName} ${person.lastName}:  Are you sure?</p>
        <form class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/person/delete" method="post">
            <input type="hidden" name="personId" value="${person.personId}"/>
            <input type="submit" class="pure-button pure-button-primary" name="command" value="Cancel"/>
            <input type="submit" class="pure-button pure-button-primary" name="command" value="Delete"/>
        </form>
    </body>
</html>
