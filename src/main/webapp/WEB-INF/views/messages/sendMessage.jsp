<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Send Message</title>
</head>
<body>
<form:form method="post"
           action="${formAction}"
           modelAttribute="message"
           cssClass="container col-6" >


    <form:hidden path="id" />

    <form:textarea path="msg" placeholder="message" cssClass="form-input" />
    <form:errors path="msg" cssClass="alet alert-danger" element="div"/>

    <form:hidden path="readed"/>
    <form:input path="title" placeholder="title" cssClass="form-input"/>
    <form:errors path="title" cssClass="alet alert-danger" element="div"/>

   <form:select path="receiver">

       <form:options items="${users}" itemValue="id" itemLabel="username"/>

   </form:select>

    <form:hidden path="sender" value="${user.getId()}"/>


    <input type="submit"  class="btn btn-success">
</form:form>
</body>
</html>
