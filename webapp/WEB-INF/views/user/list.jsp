<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Books</h1>


<ul>
    <tr></tr>
    <c:forEach items="${users}" var="user">
        <li>
            ${user.id}
            ${user.email}
            ${user.firstName}
            ${user.lastName}
                <a href="${pageContext.request.contextPath}/user/edit/${user.id}">edytuj</a>
                <a href="${pageContext.request.contextPath}/user/del/${user.id}">usuń</a>
    </c:forEach>
</ul>

</body>
</html>