<%--
  Created by IntelliJ IDEA.
  User: seymo
  Date: 11/3/2017
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
    Document   : create
    Created on : Apr 22, 2011, 3:24:13 PM
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
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
    <title>Create Client</title>
    <style>
        h1 {
            padding-left:30px;
        }
        div {
            padding-left:30px;
        }
        input {
            /*margin-bottom: 20px;*/
        }
        a {
            padding-left: 30px;
        }
    </style>
</head>
<body>
<h1>Create Client</h1>
<p><a class="pure-button" href="${pageContext.request.contextPath}/client/list">Cancel</a>
<c:if test="${fn:length(errors) gt 0}">
    <p>Please correct the following errors in your submission:</p>
    <ul>
        <c:forEach items="${errors}" var="error">
            <li>${error}</li>
        </c:forEach>
    </ul>
</c:if>
<div>
    <form name ="create" class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/client/create" method="POST">
        <br/>
        <label for="clientName">Client Name:</label>
        <input type="text" name="clientName" value="${client.clientName}"/>
        <br/>
        <label for="clientURI">Client URI:</label>
        <input type="text" name="clientURI" value="${client.clientURI}"/>
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
        <input type="text" name="clientZip" value="${client.clientZip}"/>
        <br/>
        <input type="submit" class="pure-button pure-button-primary" name="Submit" value="Submit"/>
    </form>
</div>
<script>
    $(function() {
        $("form[name='create']").validate({
            rules: {
                clientName: "required",
                clientURI:{
                    required:true,
                    url: true
                },
                clientPhone: {
                    required: true,
                    phoneUS: true,
                },
                clientStreetAddress: "required",
                clientCity:"required",
                clientState:{
                    required: true,
                    minlength: 2,
                    maxlength: 2
                },
                clientZip:{
                    required: true,
                    minlength: 5,
                    maxlength: 5
                }
            },
            messages: {
                clientName: "Please enter company name",
                clientURI: "Please provide a valid website",
                clientPhone: "Please provide a phone number",
                clientStreetAddress: "Please Provide a street address",
                clientCity: "please provide a city",
                clientState: {
                    minlength: "Your state must be 2 characters"
                },
                clientZip: {
                    minlength: "Please enter a 5 digit zipcode"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
</body>
</html>