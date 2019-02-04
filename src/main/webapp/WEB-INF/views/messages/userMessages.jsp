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
    <c:forEach items="${sent}" var="st">
         text :${st.msg} receiver name : ${st.getReceiver().getUsername()}<br>
        <a href="http://localhost:8080/message/showMsg/${st.id}">Show Msg</a><br>
        <c:if test="${st.readed}">
            status : Przeczytane
        </c:if> <br>
        <c:if test="${!st.readed}">
            status :  Nie przeczytane
        </c:if> <br>
    </c:forEach>

<h3>Received Messages</h3>
    <c:forEach items="${received}" var="rec">
        text :${rec.msg} sender name : ${rec.getSender().getUsername()}<br>
        <a href="http://localhost:8080/message/showMsg/${rec.id}">Show Msg</a><br>

        <c:if test="${rec.readed}">
            status :  Przeczytane
        </c:if>
        <c:if test="${!rec.readed}">
            status : Nie przeczytane
        </c:if> <br>
    </c:forEach>

</body>
</html>
