<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

    <title>Books data</title>
</head>
<body>

<h1>Books details</h1>
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
