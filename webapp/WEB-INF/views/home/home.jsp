<%--
  Created by IntelliJ IDEA.
  User: paladyn
  Date: 25.01.19
  Time: 09:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>
</head>
<body>
    <h1>Home Page</h1>
    <a href="http://localhost:8080/user/${pageContext.request.contextPath}/tweets">sprawdz tweety</a><br>
    <a href="http://localhost:8080/tweet/add">dodaj tweet</a><br>
    <a href="http://localhost:8080/user/add">dodaj uzytkownika</a><br>
    <a href="http://localhost:8080/user/all">wszyscy uzytkownicy</a><br>

</body>
</html>
