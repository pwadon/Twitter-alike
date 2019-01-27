<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Messages</title>
</head>
<body>

<h1> Your Messages</h1>

<h3>Sent Messages</h3>
    <c:forEach items="sent" var="st">
         text :${st.message} receiver Id : ${st.getReceiver().getUsername()}
    </c:forEach>

<h3>Received Messages</h3>
    <c:forEach items="received" var="rec">
        text :${rec.message} sender Id : ${rec.getSender().getUsername()}
    </c:forEach>

</body>
</html>
