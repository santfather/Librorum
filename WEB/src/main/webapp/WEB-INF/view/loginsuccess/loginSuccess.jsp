<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
        <title>Login Success Page</title>
    </head>
    <br>
    <h4>Hi, <span><sec:authentication property="principal.displayName"/>
    </span>Login successful! </h4>
    <br>

    <div style="color: navy">Your login is <b>${pageContext.request.userPrincipal.name}</b>
    </div>
    <br>
    <!-- For ADMIN -->
    <sec:authorize access="hasRole('ROLE_ADMIN')">

    <div style="color: #e93e31">
        <br>
        <c:if test="${not empty message}">
            INFO : ${message}
        </c:if>
        <br>
    </div>

    <form name="Books" action="/admin/users" method="get">
        <div class="col-sm-offset col-sm">
            <input type="submit" class="btn btn-primary btn-lg" value="see all users">
        </div>
    </form>
    <br>
    <form name="Books" action="/admin/books" method="get">
        <div class="col-sm-offset col-sm">
            <input type="submit" class="btn btn-primary btn-lg"
                   value="see all books">
        </div>
    </form>

        <c:url var="logout" value="/admin/logout"/>
    <a class="logout" href="${logout}" id="logOutButton">Log Out</a>

    </sec:authorize>


    <!-- For USER -->

    <sec:authorize access="hasRole('ROLE_USER')">

    <div style="color: #e93e31">
        <br>
        <c:if test="${not empty message}">
            INFO : ${message}
        </c:if>
        <br>
    </div>

    <form name="Books" action="/user/booksuser" method="get">
        <div class="col-sm-offset col-sm">
            <input type="submit" class="btn btn-primary btn-lg"
                   value="see all books">
        </div>
    </form>
    <br>
        <c:url var="logout" value="/user/logout"/>
    <a class="logout" href="${logout}" id="logOutButton">Log Out</a>
    </sec:authorize>

    </body>
    </html>
