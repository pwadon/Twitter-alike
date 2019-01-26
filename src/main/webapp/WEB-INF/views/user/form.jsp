<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <style>
        input, select{
            display: block;
            margin:15px 0;
            width: 100%;
        }
    </style>
</head>
<body>

<form:form method="post"
           action="${formAction}"
           modelAttribute="user"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="email" placeholder="email" cssClass="form-input"/>
    <form:errors path="email" cssClass="alet alert-danger" element="div"/>

    <form:hidden path="enabled" />

    <form:password path="password" placeholder="password" cssClass="form-input"/>
    <form:errors path="password" cssClass="alet alert-danger" element="div"/>

    <input type="password" placeholder="powtorz haslo" name="rp">
    <c:if test="${error}">
        Wrong password
    </c:if>

    <form:input path="username" placeholder="login" cssClass="form-input" />
    <form:errors path="username" cssClass="alet alert-danger" element="div"/>
    <c:if test="${usererror}">
        User already Exists
    </c:if>



    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>