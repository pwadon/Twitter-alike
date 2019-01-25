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
           modelAttribute="tweet"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:input path="created" value="${tweet.created}" placeholder="created" cssClass="form-input"/>
    <form:errors path="created" cssClass="alet alert-danger" element="div"/>

    <form:input path="title" placeholder="title" cssClass="form-input"/>
    <form:errors path="title" cssClass="alet alert-danger" element="div"/>

    <form:input path="tweetText" placeholder="tweetText" cssClass="form-input" />
    <form:errors path="tweetText" cssClass="alet alert-danger" element="div"/>

    <form:select path="user">
        <form:option value="0" disabled="true" selected="true" label="wybierz usera"/>
        <form:options  items="${users}" itemValue="id" itemLabel="firstName"/>

    </form:select>
    <form:errors path="user" cssClass="alet alert-danger" element="div"/>

    <input type="submit"  class="btn btn-success">
</form:form>

</body>
</html>