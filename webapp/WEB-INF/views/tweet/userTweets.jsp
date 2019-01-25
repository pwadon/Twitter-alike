<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>User Tweets</h1>

<ul>
    <c:forEach items="${tweets}" var="tweet">
        <li>
          id= ${tweet.id}
          created = ${tweet.created}
          title = ${tweet.title}
          text = ${tweet.tweetText}
        </li>
    </c:forEach>
</ul>

</body>
</html>