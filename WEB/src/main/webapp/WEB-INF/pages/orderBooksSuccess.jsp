<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
			<th>Id</th>
			<th>author</th>
			<th>name</th>
			<th>bookgenre</th>
		</tr>
			<tr>
				<td>${orderedBooks.Id}</td>
				<td>${orderedBooks.author}</td>
				<td>${orderedBooks.name}</td>
				<td>${orderedBooks.bookgenre}</td>
			</tr>
	</table>
	<h5>${user},your order is successful.</h5>
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
	<form name="Books" action="controller" method="post">
		<input type="hidden" name="command" value="Books"> <input
			type="submit" class="btn btn-success" value="make another order">
	</form>
	<br>
	<a href="controller?command=logout">Logout</a>
</body>
</html>