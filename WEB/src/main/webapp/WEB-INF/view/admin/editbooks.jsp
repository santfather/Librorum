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

    <title>Books editor</title>
</head>
<body>

<h1>Books editor</h1>


<h4> Old version </h4>
<table class="table table-bordered" border="1">
    <tr>
        <th width="20">id</th>
        <th width="80">author</th>
        <th width="80">name</th>
        <th width="60">availability</th>
        <th width="80">bookgenre</th>
    </tr>
    <tr>
        <td>${books.booksId}</td>
        <td>${books.author}</td>
        <td>${books.name}</td>
        <td>${books.availability}</td>
        <td>${books.booksType.bookgenre}</td>
    </tr>
</table>
<br>
<br>
<br>
<h4> New version </h4>

<form:form name="FormCreation" action="/edit/books" method="post" modelAttribute="books"
           class="form-horizontal">

<table class="table table-bordered" border="1">
    <tr>
        <th width="20">id</th>
        <th width="80">author</th>
        <th width="80">name</th>
        <th width="60">availability</th>
        <th width="80">bookgenre</th>
    </tr>
    <tr>

        <td><form:input type="number" path="booksId" id="in1" readonly="true" size="8" disabled="true" class="form-control"></form:input>
            <form:input type="hidden" path="booksId"/></td>
        <td><input type="number" name="author" min="1" max="100000"
                        class="form-control" pattern="[0-9]"
                        path="author" required="true"/></td>
        <td><input type="text" name="name" class="form-control"  path="name"
                        required="true"></td>
        <td><select class="form-control" name="availability" path="availability"
                    required="true">
            <option value="0">no</option>
            <option value="1">yes</option>
        </select></td>
        <td><select class="form-control" path="bookgenre" name="bookgenre"
                    required="true">
            <option value="Detective">detective</option>
            <option value="Poems">Poems</option>
            <option value="Science Fiction & Fantasy">Science Fiction & Fantasy</option>
            <option value="Humor book">Humor book</option>
            <option value="Thrillers & Suspense">Thrillers & Suspense</option>
        </select></td>
    </tr>
</table>

<input type="submit" class="btn btn-success"
       value="<spring:message text="Edit Books/>"/>
</form:form>
<br>
<br>

<form action="/admin/books" method="get">
    <input type="submit" value="Cancel" class="btn btn-primary btn-lg">
</form>