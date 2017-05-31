<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>

<html xmlns:jsp="http://java.sun.com/JSP/Page"
      xmlns:c="http://java.sun.com/jsp/jstl/core"
      xmlns:s="http://www.springframework.org/tags/form"
      xmlns:spring="http://www.springframework.org/tags"
      xmlns="http://www.w3.org/1999/xhtml" version="2.0"
      xmlns:sec="http://www.springframework.org/security/tags"
      doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
      doctype-root-element="html" omit-xml-declaration="false">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
    .logout {
        margin: 10px;
    }
</style>

<header>
    <div style="float: left;">
        <a href="?locale=ru" style="padding: 5px">RU</a>
        <a href="?locale=en" style="padding: 5px">EN</a>
    </div>
    <div>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
            <span><code>    <sec:authentication property="principal.displayName"/></code></span>
        </sec:authorize>

    </div>
</header>
</html>



