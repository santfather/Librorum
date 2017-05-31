<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


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
    <title>Bookss</title>
</head>
<body>
<h1>Bookss</h1>

<div style="color: #e93e31">
    <br>
    <c:if test="${not empty message}">
        INFO : ${message}
    </c:if>
    <br>
</div>

<c:if test="${!empty listBooks}">
    <table class="table table-bordered" border="1">
        <tr>
            <th width="20">id</th>
            <%--<th width="20">number</th>--%>
            <th width="80">author</th>
            <th width="80">name</th>
            <th width="60">year</th>
            <th width="80">bookgenre</th>
            <th width="60">availability</th>
            <th width="60">Make an order</th>
        </tr>
        <c:forEach items="${listBooks}" var="books">
            <tr>
                <td>${books.booksId}</td>
                <%--<td>${offset + itr.index +1 }</td>--%>
                <td>${books.author}</td>
                <td><a href="/booksuserdata/${books.booksId}" target="_blank">${books.author}</a></td>
                <td>${books.name}</td>
                <td>${books.booksType.bookgenre}</td>
                <td><a href="/order-tour/${books.booksId}">Make an order</a></td>
            </tr>
        </c:forEach>
    </table>
    <tag:paginate max="15" offset="${offset}" count="${count}"
                  uri="/user/booksuser" next="&raquo;" previous="&laquo;" />
</c:if>
<br>



<br>
<form action="/loginsuccess/loginSuccess" method="get">
    <input type="submit" value="User's page" class="btn btn-primary btn-lg">
</form>
<br>
<form action="/user/logout" var="logout" method="post">
    <input type="submit" value="Logout" class="btn btn-primary btn-lg">
</form>
</body>
</html>