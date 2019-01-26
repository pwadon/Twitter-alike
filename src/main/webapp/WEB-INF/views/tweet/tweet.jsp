<%--
  Created by IntelliJ IDEA.
  User: paladyn
  Date: 26.01.19
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tweet</title>
</head>
<body>
<a href="http://localhost:8080/home">HOME</a>

tweet id : ${tweet.getId()}<br>
Date : ${tweet.created} <br>
Title: ${tweet.title} <br>
User nick : ${tweet.getUser().getUsername()} <br>
Text : ${tweet.tweetText}
</body>
</html>
