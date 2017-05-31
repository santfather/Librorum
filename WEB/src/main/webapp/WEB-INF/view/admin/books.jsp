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

    <title>Books list</title>
</head>
<body>

<h1>Books</h1>

<div style="color: #e93e31">
    <c:if test="${not empty message}">
        INFO : ${message}
    </c:if> <br/>
</div>


<c:if test="${!empty listBooks}">
    <table class="table table-bordered" border="1">
        <tr>
            <<th width="20">id</th>
            <th width="80">author</th>
            <th width="80">name</th>
            <th width="60">availability</th>
            <th width="80">bookgenre</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="books">
            <tr>
                <td>${books.booksId}</td>
                <td>${books.author}</td>
                <td><a href="/booksuserdata/${books.booksId}" target="_blank">${books.author}</a></td>
                <td>${books.name}</td>
                <td>${books.booksType.bookgenre}</td>
                <td><a href="/edit/${books.booksId}">Edit</a></td>
                <td><a href="/remove/${books.booksId}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h4>Create books</h4>

<c:url var="addAction" value="/admin/books/add"/>
<form:form name="FormCreation" action="${addAction}" method="post" modelAttribute="books"
           class="form-horizontal">

    <div class="form-group">
        <label for="input3" class="col-sm-2 control-label" path="author">Author: </label>
        <div style="width: 25em" class="col-sm-10">
            <form:input type="number" name="author" min="1" max="10000"
                        class="form-control" id="input3" pattern="[0-9]"
                        path="author" required="true"/>
        </div>
    </div>
    <br>
    <div class="form-group">

        <label for="input4" class="col-sm-2 control-label" path="name">Name: </label>
        <div style="width: 25em" class="col-sm-10">
            <form:input type="text" name="name" class="form-control" id="input4" path="name"
                        placeholder="Name" required="true"></form:input>
        </div>
    </div>
    <br>
    <div class="form-group">
        <label for="input5" class="col-sm-2 control-label" path="availability">Availability:</label>
        <div style="width: 25em" class="col-sm-10">
            <div class="input-group"><form:select class="form-control" name="availability" path="availability" id="input5"
                                                 required="true">
             </form:select>
                <span class="input-group-addon">*</span>
            </div>
        </div>
    </div>
    <br>

    <div class="form-group">
        <label for="input6" class="col-sm-2 control-label" path="bookgenre">Bookgenre: </label>
        <div style="width: 25em" class="col-sm-10">
            <div class="input-group">
                <form:select class="form-control" path="boookgenre" name="bookgenre" id="input6" required="true">
                    <option value="Detective" id="1">detective</option>
                    <option value="Poems" id="2">poems</option>
                    <option value="Science Fiction & Fantasy" id="3">Science Fiction & Fantasy</option>
                    <option value="Humor book" id="4">humor book</option>
                    <option value="Thrillers & Suspense" id="5">thrillers & suspense</option>
                </form:select>
                <span class="input-group-addon">*</span>
            </div>
        </div>
    </div>
    <br>

    <input type="submit" class="btn btn-success"
           value="<spring:message text="Create Books"/>"/>
</form:form>
<br>
<form action="/loginsuccess/loginSuccess" method="get">
    <input type="submit" value="Admin's page" class="btn btn-primary btn-lg">
</form>
<br>
<form action="/admin/logout" var="logout" method="post">
    <input type="submit" value="Logout" class="btn btn-primary btn-lg">
</form>
</body>
</html>