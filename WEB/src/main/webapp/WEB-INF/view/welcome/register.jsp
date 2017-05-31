<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:jsp="http://java.sun.com/JSP/Page"
      xmlns:c="http://java.sun.com/jsp/jstl/core"
      xmlns:form="http://www.springframework.org/tags/form"
      xmlns:spring="http://www.springframework.org/tags"
      xmlns="http://www.w3.org/1999/xhtml" version="2.0"

      doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
      doctype-root-element="html" omit-xml-declaration="false">
<jsp:directive.page pageEncoding="UTF-8" contentType="text/html; UTF-8"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
          crossorigin="anonymous">
    <style>
        h1 {
            color: #428bcf
        }
    </style>
    <title><spring:message code="label.login.register"/></title>
</head>
<body>

<div style="color: #f56778">
    <c:if test="${not empty message}">
        INFO : ${message}
    </c:if> <br/>
</div>


<h1><spring:message code="label.login.register"/></h1>
<c:url value="${contextPath}/newuser/add" var="reg"/>
<form:form id="RegisterForm" name="user" method="post" action="${reg}" modelAttribute="user" class="form-horizontal">
    <form:input id="userId" type="hidden" path="userId" value="" maxlength="11"/>
    <div class="form-group">
        <label for="input3" class="col-sm-2 control-label"><spring:message code="label.user.login"/></label>
        <form:errors path="login" cssStyle="color: red"/>
        <div style="width: 25em" class="col-sm-10">
            <input type="text" name="login" path="login" class="form-control" id="input3"
                   placeholder="Login" required/>
        </div>
    </div>
    <br>
    <div class="form-group">
        <label for="input4" class="col-sm-2 control-label"><spring:message code="label.user.password"/></label>
        <form:errors path="password" cssStyle="color: red"/>
        <div style="width: 25em" class="col-sm-10">
            <input type="password" name="password" class="form-control" id="input4" path="password"
                   placeholder="Password" required>
        </div>
    </div>
    <br>
    <div class="form-group">
        <label for="input5" class="col-sm-2 control-label"><spring:message code="label.user.name"/></label>
        <form:errors path="name" cssStyle="color: red"/>
        <div style="width: 25em" class="col-sm-10">
            <input type="text" name="name" path="name" placeholder="Name" class="form-control" id="input5" required>
        </div>
    </div>
    <br>
    <div class="form-group">
        <label for="input6" class="col-sm-2 control-label"><spring:message code="label.user.surname"/></label>
        <form:errors path="surname" cssStyle="color: red"/>
        <div style="width: 25em" class="col-sm-10">
            <input type="text" name="surname" class="form-control" path="surname" id="input6" placeholder="Surname"
                   required>
        </div>
    </div>
    <div class="btn btn-success">
        <spring:message code="label.login.register2" var="labelSubmitReg"></spring:message>
        <input type="submit" value="${labelSubmitReg}" class="btn btn-success">
    </div>
</form:form>

<form action="/" method="get">
    <input type="submit" value="Cancel" class="btn btn-primary btn-lg">
</form>

</body>
</html>