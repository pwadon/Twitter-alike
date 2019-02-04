<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>User Tweets</h1>

<ul>

    <c:forEach items="${currentUserTweets}" var="tweet">
        <li>
            id = ${tweet.id}<br>
            text = ${tweet.tweetText}<br>
            Date : ${tweet.created} <br>
            Title:${tweet.title} <br>
            User nick : ${tweet.getUser().getId()} <br>

        </li>
    </c:forEach>
</ul>

</body>
</html>