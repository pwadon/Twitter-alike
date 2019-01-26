<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tweet</title>
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
<a href="http://localhost:8080/home">HOME</a><br>

tweet id : ${tweet.getId()}
Date : ${tweet.created}
Title: ${tweet.title}
User nick : ${tweet.getUser().getUsername()}
Text : ${tweet.tweetText}<br>


<c:forEach items="${tweet.getComments()}" var="comment">
comment : ${comment.getText()} date : ${comment.getCreated()} author : ${comment.getUser().getUsername()}<br>
</c:forEach>

<c:if test="${user != null}">

<form:form method="post"
            action="/tweet/${tweet.getId()}"
            modelAttribute="comment"
           cssClass="container col-6" >
    <form:hidden path="id"/>

    <form:input path="text" placeholder="text" cssClass="form-input"/>
    <form:errors path="text" cssClass="alert alert-danger" element="div"/>

    <form:hidden path="created"/>

    <form:hidden path="tweet" value="${tweet.getId()}"/>
    <form:hidden path="user" value="${user.getId()}"/>

    <input type="submit" class="btn btn-success">

</form:form>

</c:if>
</body>
</html>
