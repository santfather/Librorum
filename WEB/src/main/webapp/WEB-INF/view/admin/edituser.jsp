<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        h1, h4 {
            color: #428bcf
        }
    </style>

    <title>User editor</title>
</head>
<body>

<h1>User editor</h1>

<form:form name="FormCreation" action="/edit/user" method="post" modelAttribute="user"
           class="form-horizontal">

<table class="table table-bordered" border="1">
    <tr>
        <th width="20">id</th>
        <th width="80">login</th>
        <th width="80">name</th>
        <th width="60">surname</th>
        <th width="60">email</th>
        <th width="60">state</th>
        <th width="60">roles</th>

    </tr>
    <tr>
        <td>${user.userId}
            <form:input type="hidden" name="userId" path="userId"/></td>
        <td>${user.login}
<%--
        <form:input type="hidden" name="login" path="login"/></td>
--%>
        <td>${user.name}
     <%--   <form:input type="hidden" name="name" path="name"/></td>
        <form:input type="hidden" name="password" path="password"/>--%>
        <td>${user.surname}
<%--
        <form:input type="hidden" name="surname" path="surname"/></td>
--%>
        <td>${user.email}
<%--
        <form:input type="hidden" name="discount" path="email"/></td>
--%>

        <td><select class="form-control" path="Sstate" name="State"
                    required="true">
            <option value="Active">Active</option>
            <option value="Removed">Removed</option>
            <option value="Locked">Locked</option>
        </select>
        </td>
        <td>${user.userProfiles}</td>
<%--
        <form:input type="hidden" path="userProfiles"/>
--%>

    </tr>
</table>

<input type="submit" class="btn btn-success"
       value="<spring:message text="Edit User"/>"/>
</form:form>
<br>
<br>
<form action="/admin/users" method="get">
    <input type="submit" value="Cancel" class="btn btn-primary btn-lg">
</form>