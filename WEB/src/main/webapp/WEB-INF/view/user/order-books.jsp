<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
h1 {
	color: #428bcf
}
</style>
<title>Order Books Success Page</title>
</head>
<body>
	<h1>Successful order of a books</h1>
	<table class="table table-bordered" border="1">
		<tr>
			<th>booksId</th>
			<th>author</th>
			<th>name</th>
			<th>bookgenre</th>
		</tr>
			<tr>
				<td>${books.booksId}</td>
				<td>${books.author}</td>
				<td>${books.name}</td>
				<td>${books.bookgenre}</td>
			</tr>
	</table>
	<h5><sec:authentication property="principal.displayName"/>,your order is successful.</h5>
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
	<form action="/user/booksuser" method="get">
		<input type="submit" value="Make another order" class="btn btn-success">
	</form>


	<br>
	<form action="/user/logout" var="logout" method="post">
		<input type="submit" value="Logout" class="btn btn-primary btn-lg">
	</form>
</body>
</html>