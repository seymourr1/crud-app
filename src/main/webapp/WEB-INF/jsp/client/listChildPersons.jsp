<%--
  Created by IntelliJ IDEA.
  User: seymo
  Date: 11/3/2017
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Client Listing</title>
</head>
<style>
    table {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        grid-auto-columns: auto;
        max-width: 100%;
    }
    table td th{
        border: 1px solid #ddd;
        padding: 8px;
    }
    table tr:nth-child(even){
        background-color: #f2f2f2;
    }
    table tr:hover {
        background-color: #ddd;
    }
    table th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: lightblue;
        color: white;
    }
</style>
<body>
<h1>Client Listing</h1>
<p><a class="pure-button" href="${pageContext.request.contextPath}/client/create">Create New Client</a>
    <a class="pure-button" href="${pageContext.request.contextPath}/client/list">Back to Clients</a></p>
<c:choose>
    <c:when test="${fn:length(persons) gt 0}">
        <table>
            <thead>
            <tr>
                <th>First</th>
                <th>Last</th>
                <%--<th>Phone Number</th>--%>
                <%--<th>Actions</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${persons}" var="persons">
                <tr>
                    <td>${persons.firstName}</td>
                    <td>${persons.lastName}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>No results found.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
