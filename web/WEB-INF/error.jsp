<%-- 
    Document   : error
    Created on : May 11, 2015, 5:19:55 AM
    Author     : Corncob
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" import="java.io.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Index page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <script type="text/javascript" src="js/hover_pack.js"></script>
    </head>
    <body>

        <%@ include file="header.jsp" %>
        <!--header-->
        <div class="about">
            <div class="container">
                <div class="page-not-found">
                    <h1>Đã có lỗi xảy ra</h1>
                    
                </div>
                <table width="100%" border="1">
                        <tr valign="top">
                            <td width="40%"><b>Error:</b></td>
                            <td>${pageContext.exception}</td>
                        </tr>
                        <tr valign="top">
                            <td><b>URI:</b></td>
                            <td>${pageContext.errorData.requestURI}</td>
                        </tr>
                        <tr valign="top">
                            <td><b>Status code:</b></td>
                            <td>${pageContext.errorData.statusCode}</td>
                        </tr>
                        <tr valign="top">
                            <td><b>Stack trace:</b></td>
                            <td>
                        <c:forEach var="trace" 
                                   items="${pageContext.exception.stackTrace}">
                            <p>${trace}</p>
                        </c:forEach>
                        </td>
                        </tr>
                    </table>
            </div>
        </div>

        <!--footer-->
        <%@ include file="footer.jsp" %>

    </body>
</html>		