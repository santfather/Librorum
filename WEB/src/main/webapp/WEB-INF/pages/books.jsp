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
<title>Books</title>
</head>
<body>
	<h1>Books</h1>
	<table class="table table-bordered" border="1">
		<tr>
			<th>id</th>
			<th>authoe</th>
			<th>name</th>
			<th>year</th>
			<th>bookgenre</th>
			<th>quantity</th>
			<th>availability</th>
		</tr>
		<c:forEach var="booksList" items="${booksList}">
			<tr>
				<td>${booksList.Id}</td>
				<td>${booksList.author}</td>
				<td>${booksList.name}</td>
				<td>${booksList.year}</td>
				<td>${booksList.bookgenre}</td>
				<td>${booksList.quantuty}</td>
			    <td>${booksList.availability}</td>
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
	<form action="controller" method="post">
		<input type="hidden" name="command" value="BooksOrder"> Enter
		booksId of your order: <input type="number" min="1" max="100"
			name="thisBooksOrder" pattern="[0-9]" placeholder="1 - 100" required>
		<input type="hidden" name="user" value="${user}">
		<div>
			<b>${errorBooksIdMassege}</b>
		</div>
		<br> <br> <input type="submit" class="btn btn-success"
			value="Order">
	</form>

	<br>
	<form action="controller" method="post">
		<input type="hidden" name="command" value="Logout"> <input
			type="submit" value="Logout" class="btn btn-primary btn-lg">
	</form>
</body>
</html>