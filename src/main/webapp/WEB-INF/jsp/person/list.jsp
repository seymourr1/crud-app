<%-- 
    Document   : list
    Created on : Apr 22, 2011, 2:25:22 PM
    Author     : FMilens
--%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Person Listing</title>
    </head>
    <style>
        h1 {
            color: #111; font-family: 'Helvetica Neue', sans-serif; font-size: 30px; font-weight: bold; letter-spacing: -1px; line-height: 1; text-align: left;
        }
        table {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            grid-auto-columns: auto;
            max-width: 100%;
        }
        table td th{
            border: 1px solid #ddd;
            padding: .03em;
            text-align: left;
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
        <h1>Person Listing</h1>     
        <p><a class="pure-button" href="${pageContext.request.contextPath}/person/create">Create New Person</a>
            <a class="pure-button" href="${pageContext.request.contextPath}/client/list">View Clients</a></p>
        <c:choose>
            <c:when test="${fn:length(persons) gt 0}">
                <table cellpadding="10" cellspacing="10">
                    <thead>
                        <tr>
                            <th>First</th>
                            <th>Last</th>
                            <th>Email</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${persons}" var="person">
                            <tr>
                                <td>${person.firstName}</td>
                                <td>${person.lastName}</td>
                                <td>${person.emailAddress}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit Person</a>
                                    <a href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete Person</a>
                                    <%--<a href="${pageContext.request.contextPath}/person/listParentClient/${person.clientId}">Associated Clients</a>--%>
                                </td>
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
