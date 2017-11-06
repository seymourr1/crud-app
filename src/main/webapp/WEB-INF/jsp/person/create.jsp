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
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Person</title>
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
        <h1>Create Person</h1>
        <a class="pure-button" href="${pageContext.request.contextPath}/person/list">Cancel</a>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>
        <div>
                    <form name="create" class="pure-form pure-form-aligned" action="${pageContext.request.contextPath}/person/create" method="POST">
                    <br/>
                    <label for="firstName">First Name:</label>
                    <input type="text" name="firstName" value="${person.firstName}"/>
                    <br/>
                    <label for="lastName">Last Name:</label>
                    <input type="text" name="lastName" value="${person.lastName}"/>
                    <br/>
                    <label for="emailAddress">Email Address:</label>
                    <input type="text" name="emailAddress" value="${person.emailAddress}"/>
                    <br/>
                    <label for="streetAddress">Street Address:</label>
                    <input type="text" name="streetAddress" value="${person.streetAddress}"/>
                    <br/>
                    <label for="city">City:</label>
                    <input type="text" name="city" value="${person.city}"/>
                    <br/>
                    <label for="state">State:</label>
                    <input type="text" name="state" value="${person.state}"/>
                    <br/>
                    <label for="zipCode">Zip Code:</label>
                    <input type="text" name="zipCode" value="${person.zipCode}"/>
                    <br/>
                    <input type="submit" class="pure-button pure-button-primary" name="Submit" value="Submit"/>
                </form>
            </div>
    <script>
        $(function() {
            $("form[name='create']").validate({
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
