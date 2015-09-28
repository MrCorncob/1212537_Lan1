<%-- 
    Document   : logout
    Created on : May 11, 2015, 5:26:51 AM
    Author     : Corncob
--%>

<%@page import="com.onlineshopping.POJO.OperatingSystem"%>
<%@page import="com.onlineshopping.POJO.Manufacture"%>
<%@page import="com.onlineshopping.POJO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    ArrayList<Manufacture> manufactureList = (ArrayList<Manufacture>)session.getAttribute("manufactureList");
    ArrayList<OperatingSystem> osList = (ArrayList<OperatingSystem>)session.getAttribute("osList");
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Logout page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <!--webfont-->
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/hover_pack.js"></script>
    </head>
    <body>

        <%@ include file="header.jsp" %>
        <!--header-->
        <div class="main">
            <div class="about">
                <div class="container">
                    <%  
                    if (user == null) {
                    %>
                    <h1>Bạn chưa đăng nhập!</h1>

                    <%
                    } else {
                        session.invalidate();
                    %>
                    <h1>Đã đăng xuất thành công</h1>
                    <p>Bạn sẽ được chuyển về trang chủ sau 3s nữa</p>
                    <script>
            window.setTimeout(function () {
                window.location.href = "index.html";
            }, 3000);
                    </script>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <!--footer-->
        <%@ include file="footer.jsp" %>

    </body>
</html>		
