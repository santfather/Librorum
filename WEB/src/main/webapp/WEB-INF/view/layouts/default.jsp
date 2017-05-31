<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:jsp="http://java.sun.com/JSP/Page"
      xmlns:c="http://java.sun.com/jsp/jstl/core"
      xmlns:u="urn:jsptagdir:/WEB-INF/tags/utils"
      xmlns:com="urn:jsptagdir:/WEB-INF/tags/common"
      xmlns:spring="http://www.springframework.org/tags"
      xmlns:tiles="http://tiles.apache.org/tags-tiles">

<head>
    <style>

        footer {
             background-color: #f3f2f5;
            padding: 25px;
        }
    </style>
        <title><spring:message code="page.user.title"/></title>
</head>
<body>

<header id="header">
    <tiles:insertAttribute name="header" />
</header>

<section id="site-content">
    <tiles:insertAttribute name="body" />
</section>

<footer id="footer">
    <tiles:insertAttribute name="footer" />
</footer>
</body>
</html>