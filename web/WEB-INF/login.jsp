<%-- 
    Document   : login.jsp
    Created on : May 10, 2015, 3:11:59 AM
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
        <title>Login page</title>
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
                    <div class="register">
                        <div class="col-md-6 login-left">
                            <h3>KHÁCH HÀNG MỚI?</h3>
                            <p>Hãy nhanh tay đăng kí tài khoản mới, bạn sẽ có thể thanh toán dễ dàng hơn, lưu trữ thông tin/địa chỉ thanh toán, kiểm tra đơn hàng và hơn thế nữa. </p>
                            <a class="acount-btn" href="register.html">Đăng Kí</a>
                        </div>
                        <div class="col-md-6 login-right">
                            <h3>KHÁCH HÀNG ĐÃ ĐĂNG KÍ</h3>
                            <p>Nếu bạn đã có một tài khoản, hãy đăng nhập</p>
                            <form action="login.html" method="post">
                                <div>
                                    <span>Tên tài khoản<label>*</label></span>
                                    <input type="text" name="username" > 
                                </div>
                                <div>
                                    <span>Mật khẩu<label>*</label></span>
                                    <input type="password" name="password" > 
                                </div>
                                <%                
                                    String message = (String) session.getAttribute("message");
                                    if (message !=null) {
                                        out.print("<label>" + message + "</label></br>");
                                       
                                    }
                                %>
                                <a  href="forgot.html">Quên mật khẩu?</a>
                                <input type="submit" value="Đăng Nhập">
                                
                            </form>
                        </div>	
                        <div class="clearfix"> </div>
                    </div>

                    <%
                    } else {
                    %>
                    <h1>Bạn đã đăng nhập!</h1>
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