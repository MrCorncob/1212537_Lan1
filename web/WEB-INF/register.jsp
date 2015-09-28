<%-- 
    Document   : register
    Created on : May 10, 2015, 11:11:45 PM
    Author     : Corncob
--%>
<%
    User user = (User) session.getAttribute("user");
    String message = (String) session.getAttribute("message");
    ArrayList<Manufacture> manufactureList = (ArrayList<Manufacture>)session.getAttribute("manufactureList");
    ArrayList<OperatingSystem> osList = (ArrayList<OperatingSystem>)session.getAttribute("osList");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Register</title>
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

        <div class="about">
            <div class="container">
                <div class="register">
                    <form action="register.html" method="post"> 
                        <div class="register-bottom-grid">
                            <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                            <%                
                                    if (message != null) {
                                        out.print("<label>" + message + "</lable></br>");
                                        session.setAttribute("registerStatus", null);
                                    }
                            %>
                            <div style="float:none">
                                <span>Tên đăng nhập<label>*</label></span>
                                <input required class="form-control" type="text" name="username">
                            </div>

                            <div>
                                <span>Mật khẩu<label>*</label></span>
                                <input required class="form-control" type="password" name="password">
                            </div>
                            <div>
                                <span>Nhập lại mật khẩu<label>*</label></span>
                                <input required class="form-control" type="password" name="repassword">
                            </div>
                            <div class="clearfix"> </div>
                        </div>

                        <div class="clearfix"> </div>
                        <div class="register-top-grid">
                            <h3>THÔNG TIN CÁ NHÂN</h3>
                            <div>
                                <span>Họ<label>*</label></span>
                                <input  required class="form-control" type="text" name="firstname"> 
                            </div>
                            <div>
                                <span>Tên<label>*</label></span>
                                <input required class="form-control" type="text" name="lastname"> 
                            </div>
                            <div>
                                <span>Giới tính<label>*</label></span>
                                <input type="radio" name="gender" value="male"><label>Nam</label>
                                <input type="radio" name="gender" value="female" checked><label>Nữ</label>
                            </div>
                            <div>
                                <span>Ngày sinh<label>*</label></span>
                                <input required class="form-control" type="text" name="birthday" placeholder="yyyy-mm-dd"> 
                            </div>
                            <div>
                                <span>Địa chỉ email<label>*</label></span>
                                <input required class="form-control" type="email" name="email"> 
                            </div>
                            <div>
                                <span>Số điện thoại<label>*</label></span>
                                <input required class="form-control" type="text" name="phone"> 
                            </div>
                            <div>
                                <span>Địa chỉ<label>*</label></span>
                                <input required class="form-control" type="text" name="address"> 
                            </div>
                            <div class="clearfix"> </div>

                        </div>
                        <div class="clearfix"> </div>
                        <div class="register-but">
                                <input type="submit" value="Đăng kí">
                                <div class="clearfix"> </div>
                                                   </div>
                    </form>

                </div>
            </div>
        </div>

        <!--footer-->
        <%@ include file="footer.jsp" %>

    </body>
</html>		
