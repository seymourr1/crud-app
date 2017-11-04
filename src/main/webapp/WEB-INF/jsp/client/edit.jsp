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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Client</title>
</head>
<body>

<h1>Edit Client</h1>
<c:if test="${fn:length(errors) gt 0}">
    <p>Please correct the following errors in your submission:</p>
    <ul>
        <c:forEach items="${errors}" var="error">
            <li>${error}</li>
        </c:forEach>
    </ul>
</c:if>
<form action="${pageContext.request.contextPath}/client/edit" method="POST">
    <input type="hidden" name="clientId" value="${client.clientId}"/>
    <br/>
    <label for="clientName">Client Name:</label>
    <input type="text" name="clientName" value="${client.clientName}"/>
    <br/>
    <label for="clientURI">Client URI:</label>
    <input type="text" name="clientURI" value="${client.clientName}"/>
    <br/>
    <label for="clientPhone">Client Phone Number:</label>
    <input type="text" name="clientPhone" value="${client.clientPhone}"/>
    <br/>
    <label for="clientStreetAddress">Street Address:</label>
    <input type="text" name="clientStreetAddress" value="${client.clientStreetAddress}"/>
    <br/>
    <label for="clientCity">City:</label>
    <input type="text" name="clientCity" value="${client.clientCity}"/>
    <br/>
    <label for="clientState">State:</label>
    <input type="text" name="clientState" value="${client.clientState}"/>
    <br/>
    <label for="clientZip">Zip Code:</label>
    <input type="text" name="zipCode" value="${client.clientZip}"/>
    <br/>
    <input type="submit" name="Submit" value="Submit"/>
</form>

</body>
</html>
