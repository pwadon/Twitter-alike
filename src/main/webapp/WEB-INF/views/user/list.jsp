<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Users</h1>


<ul>
    <tr></tr>
    <c:forEach items="${users}" var="user">
        <li>
            ${user.id}
            ${user.email}
            ${user.username}

    </c:forEach>
</ul>

</body>
</html>