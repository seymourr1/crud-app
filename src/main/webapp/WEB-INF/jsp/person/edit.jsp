<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Person</title>
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
        <h1>Edit Person</h1>
        <p>
            <a class="pure-button" href="${pageContext.request.contextPath}/person/list">Cancel</a>
            <a class="pure-button" href="${pageContext.request.contextPath}/person/listParentClient/${person.clientId}">Associated Clients</a>
        </p>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>

        <form:form name ="edit" class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/person/edit" modelAttribute="person" method="POST">
            <form:input type="hidden" path="personId"/>
            <table>
                <tr>
                    <th style="text-align:right">First Name</th>
                    <td><form:input type="text" id="firstName" path="firstName" /></td>
                </tr>
                <tr>
                    <th style="text-align:right">Last Name</th>
                    <td><form:input type="text" id="lastName" path="lastName"/></td>
                </tr>
                <tr>
                    <th style="text-align:right">Email Address</th>
                    <td><form:input type="text" id="emailAddress" path="emailAddress" /></td>
                </tr>
                <tr>
                    <th style="text-align:right">Street Address</th>
                    <td><form:input type="text" id="streetAddress" path="streetAddress"/></td>
                </tr>
                <tr>
                    <th style="text-align:right">City</th>
                    <td><form:input type="text" id="city" path="city" /></td>
                </tr>
                <tr>
                    <th style="text-align:right">State</th>
                    <td><form:input type="text" id="state" path="state" /></td>
                </tr>
                <tr>
                    <th style="text-align:right">Zip Code</th>
                    <td><form:input type="text" id="zipCode" path="zipCode"/></td>
                </tr>
                <tr>
                    <th style="text-align:right">Client</th>
                    <td>
                        <form:select path="clientId">
                            <form:option value="-1" label="-- Select A Company --"/>
                            <form:options items="${allClients}" itemValue="clientId" itemLabel="clientName"/>
                        </form:select>
                    </td>
                </tr>
            </table>
            <br/>
            <br/>
            <input type="submit" class="pure-button pure-button-primary" value="Submit"/>
        </form:form>
        <script>
            $(function() {
                $("form[name='edit']").validate({
                    rules: {
                        firstName: "required",
                        lastName: "required",
                        emailAddress: {
                            required: true,
                            email: true
                        },
                        streetAddress: "required",
                        city:"required",
                        state:{
                            required: true,
                            minlength: 2,
                            maxlength: 2
                        },
                        zipCode:{
                            required: true,
                            minlength: 5,
                            maxlength: 5
                        }
                    },
                    messages: {
                        firstName: "Please enter your firstname",
                        lastName: "Please enter your lastname",
                        emailAddress: "Please provide a valid email",
                        streetAddress: "Please Provide a street address",
                        city: "please provide a city",
                        state: {
                            minlength: "Your state must be 2 characters"
                        },
                        zipCode: {
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
