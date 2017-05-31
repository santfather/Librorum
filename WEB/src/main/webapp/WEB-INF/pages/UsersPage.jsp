<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

h1 {
	color: #428bcf
}
</style>
<title>Users</title>
</head>
<body>
	<h1>Users</h1>
	<table class="table table-bordered" border="1">
		<tr>
			<th>userId</th>
			<th>login</th>
			<th>name</th>
			<th>surname</th>
			<th>email</th>

		</tr>
		<c:forEach var="userListWP" items="${userListWP}">
			<tr>
				<td>${userListWP.userId}</td>
				<td>${userListWP.login}</td>
				<td>${userListWP.name}</td>
				<td>${userListWP.surname}</td>
				<td>${userListWP.email}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div>
		<b>${errorDataBase}</b>
	</div>
	<div>
		<b>${wrongAction}</b>
	</div>
	<br>
	<div>
		<b>${nullPage}</b>
	</div>

	<br>
	<br>
	<form action="controller" method="post">
		<input type="hidden" name="command" value="Logout"> <input
			type="submit" value="Logout" class="btn btn-primary btn-lg">
	</form>
</body>
</html>