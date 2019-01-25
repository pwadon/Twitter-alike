<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

    <form:input path="firstName" placeholder="firstName" cssClass="form-input"/>
    <form:errors path="firstName" cssClass="alet alert-danger" element="div"/>

    <form:input path="lastName" placeholder="lastName" cssClass="form-input" />
    <form:errors path="lastName" cssClass="alet alert-danger" element="div"/>


    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>