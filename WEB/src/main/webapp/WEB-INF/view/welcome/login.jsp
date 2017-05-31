<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<?xml version="1.0" encoding="UTF-8"?>
<html xmlns:jsp="http://java.sun.com/JSP/Page"
      xmlns:c="http://java.sun.com/jsp/jstl/core"
      xmlns:s="http://www.springframework.org/tags/form"
      xmlns:spring="http://www.springframework.org/tags"
      xmlns="http://www.w3.org/1999/xhtml" version="2.0"

      doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
      doctype-root-element="html" omit-xml-declaration="false">
<jsp:directive.page pageEncoding="UTF-8" contentType="text/html; UTF-8"/>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- Bootstrap-CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" type="text/css" media="all">
    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="/assets/css/style.css" type="text/css" media="all">
    <!-- Animate.CSS -->
    <link rel="stylesheet" href="/assets/css/animate.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->

    <!-- Fonts -->
    <!-- Body-Font -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" type="text/css">
    <!-- Logo-Font -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Cinzel+Decorative:400,900,700" type="text/css">
    <!-- Navbar-Font -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700" type="text/css">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <style>
        h1 {
            color: #428bcf
        }
    </style>
    <title>Login Page</title>
</head>
<body>

<!-- Header -->
<div class="header agileits w3layouts" id="home">
    <!-- Navbar -->
    <nav class="navbar navbar-default w3l aits wow bounceInUp agileits w3layouts">
        <div class="container">

            <div class="navbar-header agileits w3layouts">
                <button type="button" class="navbar-toggle agileits w3layouts collapsed" data-toggle="collapse"
                        data-target="#navbar" aria-expanded="false">
                    <span class="sr-only agileits w3layouts">Toggle navigation</span>
                    <span class="icon-bar w3l"></span>
                    <span class="icon-bar aits"></span>
                    <span class="icon-bar w3laits"></span>
                </button>
                <!------------------------------------- Login form------------------------------------------------->
                <div style="float: right;">
                    <a href="${contextPath}?locale=ru" style="padding: 5px">RU</a>
                    <a href="${contextPath}?locale=en" style="padding: 5px">EN</a>
                   <%-- <c:url value="${sms}" var="message"/>
                    <spring:message code="${message}"></spring:message>--%>
                    <div style="color: #099f0e">
                        <c:if test="${not empty message}">
                            INFO : ${message}
                        </c:if> <br/>
                    </div>
                    <div style="color: #f56778"><b>${sms}</b></div>

                </div>
                <c:url value="${contextPath}/login" var="loginUrl"/>
                <form name="LoginForm" method="post" action="${loginUrl}" class="form-horizontal">

                    <div class="form-group">
                        <label for="user" class="col-sm-2 control-label"><b><spring:message
                                code="label.login.login"/></b></label>
                        <div style="width: 25em" class="col-sm-10">
                            <input type="text" name="user" id="user" class="form-control"
                                   placeholder="Login" required>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label"><b><spring:message
                                code="label.login.password"/></b>
                        </label>
                        <div>
                            <input type="password" name="pwd" id="password" class="form-control"
                                   placeholder="Password" required>
                        </div>

                        <div class="col-sm-offset-2 col-sm-2">
                            <spring:message code="label.login.loginButton" var="labelSubmit"></spring:message>
                            <input type="submit" value="${labelSubmit}" class="btn btn-default">
                        </div>

                    </div>
                    <div class="col-sm-offset-2 col-sm-2">
                        <a href="/welcome/register"> <spring:message code="label.login.register"/></a>
                    </div>
                </form>
            </div>
            <div id="navbar" class="navbar-collapse agileits w3layouts navbar-right collapse">
                <ul class="nav agileits w3layouts navbar-nav">
                    <li class="active"><a href="/"> <spring:message code="login.login.home"/></a></li>
  <%--                  <li><a href="about.html">ABOUT</a></li>
                    <li><a href="cuisines.html">CUISINES</a></li>--%>
                   </ul>
            </div>
        </div>
    </nav>


</div>
<!-- //Header -->


<!-- Awards -->
<div class="awards agileits w3layouts">

    <h3> <spring:message code="label.login.bottom0"></spring:message></h3>

    <div class="awards-grids">
        <div class="col-md-3 col-sm-3 awards-grid agileits w3layouts awards-grid-1 wow fadeInUp">
            <img class="wow agileits w3layouts slideInLeft" src="../../../assets/images/award-1.png"
                 alt="Agileits W3layouts">
            <h4><spring:message code="label.login.bottom1"></spring:message></h4>
            <div class="h4-underline agileits w3layouts wow slideInLeft"></div>
        </div>
        <div class="col-md-3 col-sm-3 awards-grid awards-grid-2 wow agileits w3layouts fadeInUp">
            <img class="wow agileits w3layouts slideInLeft" src="/assets/images/award-2.png" alt="Agileits W3layouts">
            <h4><spring:message code="label.login.bottom2"></spring:message></h4>
            <div class="h4-underline wow agileits w3layouts slideInLeft"></div>
        </div>
        <div class="col-md-3 col-sm-3 agileits w3layouts awards-grid awards-grid-3 wow fadeInUp">
            <img class="wow agileits w3layouts slideInLeft" src="/assets/images/award-3.png" alt="Agileits W3layouts">
            <h4><spring:message code="label.login.bottom3"></spring:message></h4>
            <div class="h4-underline wow agileits w3layouts slideInLeft"></div>
        </div>
        <div class="col-md-3 col-sm-3 agileits w3layouts awards-grid awards-grid-4 wow fadeInUp">
            <img class="wow slideInLeft agileits w3layouts" src="/assets/images/award-4.png" alt="Agileits W3layouts">
            <h4><spring:message code="label.login.bottom4"></spring:message></h4>
            <div class="h4-underline wow agileits w3layouts slideInLeft"></div>
        </div>
        <div class="clearfix"></div>
    </div>

</div>
<!-- //Awards -->

<!-- Custom-JavaScript-File-Links -->

<!-- Default-JavaScript -->
<script type="text/javascript" src="/assets/js/jquery-2.1.4.min.js"></script>
<!-- Bootstrap-JavaScript -->
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>

<!-- Animate.CSS-JavaScript -->
<script src="/assets/js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!-- //Animate.CSS-JavaScript -->

<!-- Slider-JavaScript -->
<script src="/assets/js/responsiveslides.min.js"></script>
<script>
    $(function () {
        $("#slider1, #slider2, #slider3, #slider4").responsiveSlides({
            auto: true,
            nav: true,
            speed: 1500,
            namespace: "callbacks",
            pager: true,
        });
    });
</script>
<!-- //Slider-JavaScript -->

<!-- Slide-To-Top JavaScript (No-Need-To-Change) -->
<script type="text/javascript">
    $(document).ready(function () {
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 100,
            easingType: 'linear'
        };
        $().UItoTop({easingType: 'easeOutQuart'});
    });
</script>
<a href="#" id="toTop" class="agileits w3layouts" style="display: block;"> <span id="toTopHover"
                                                                                 style="opacity: 0;"> </span></a>
<!-- //Slide-To-Top JavaScript -->

<!-- Smooth-Scrolling-JavaScript -->
<script type="text/javascript" src="/assets/js/move-top.js"></script>
<script type="text/javascript" src="/assets/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll, .navbar li a, .footer li a").click(function (event) {
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
        });
    });
</script>

</body>
</html>