<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>

</head>
<body>
    <h1>Home Page</h1>

    <a href="http://localhost:8080/user/login">login</a><br>
    <a href="http://localhost:8080/user/add">register</a><br>


    <c:if test="${user != null}">
    <form:form method="post"
               action="/tweet/add"
               modelAttribute="tweet"
               cssClass="container col-6" >

        <form:hidden path="id" />

        <form:input path="title" placeholder="title" cssClass="form-input"/>
        <form:errors path="title" cssClass="alet alert-danger" element="div"/>

        <form:input path="tweetText" placeholder="tweetText" cssClass="form-input" />
        <form:errors path="tweetText" cssClass="alet alert-danger" element="div"/>

        <form:hidden path="user" value="${user.getId()}"/>

        <input type="submit"  class="btn btn-success">
    </form:form>

        <a href="http://localhost:8080/user/tweets">Show my Tweets</a><br>
        <c:if test="${twError}">
            You Have no Tweets !
        </c:if>
    </c:if>


    <form method="post" action="/user/usersTweets" cssClass="container col-6" >

        <input type="number" name="id" placeholder="user id">
        <c:if test="${errorUserTweets}">
        Given user has no Tweets
        </c:if>

        <input type="submit"   class="btn btn-success">
    </form>

    <ul>
    <c:forEach items="${tweets}" var="tweet">
        <li>
            <h4>Date : ${tweet.created} Title: ${tweet.title} User nick : ${tweet.getUser().getUsername()} <a href="http://localhost:8080/tweet/${tweet.getId()}">Show Tweet</a>
                <br> Text : ${tweet.tweetText} </h4>
                <c:forEach items="${tweet.getComments()}" var="comment">
                comment : ${comment.getText()} user name : ${comment.getUser().getUsername()} <br>
                </c:forEach>
        </li>
    </c:forEach>
    </ul>

</body>
</html>
