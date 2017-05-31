<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<title>Users list</title>
</head>
<body>

<h1>Users</h1>
<div style="color: #e93e31">
	<c:if test="${not empty message}">
		INFO : ${message}
	</c:if> <br/>
</div>



<c:if test="${!empty listUsers}">
	<table class="table table-bordered" border="1">
		<tr>
			<th width="20">id</th>
			<th width="80">login</th>
			<th width="80">name</th>
			<th width="60">surname</th>
			<th width="60">email</th>
			<th width="60">state</th>
			<th width="60">Edit</th>
			<th width="60">roles</th>
		</tr>
		<c:forEach items="${listUsers}" var="user">
			<tr>
				<td>${user.userId}</td>
				<td><a href="/userdata/${user.userId}" target="_blank">${user.login}</a></td>
				<td>${user.name}</td>
				<td>${user.surname}</td>
				<td>${user.email}</td>
				<td>${user.state}</td>
				<td><a href="/edituser/${user.userId}">Edit</a></td>
				<td>${user.userProfiles}</td>

			</tr>
		</c:forEach>
	</table>
</c:if>
<br>
<form action="/loginsuccess/loginSuccess" method="get">
	<input type="submit" value="Admin's page" class="btn btn-primary btn-lg">
</form>
<br>
<br>

<form action="/admin/logout" var="logout" method="post">
	<input type="submit" value="Logout" class="btn btn-primary btn-lg">
</form>
</body>
</html>