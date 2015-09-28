<%-- 
    Document   : forgot.jsp
    Created on : May 10, 2015, 3:11:59 AM
    Author     : Corncob
--%>
<%@page import="com.onlineshopping.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Phục Hồi Mật Khẩu</title>
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
                    <%  User currentUser = (User) session.getAttribute("user");
                        if (currentUser == null) {
                    %>
                    <div class="forgot">
                        <img src="images/flat_asterisk_banner.png" alt="white asterisk logo" class="asterisk">
                        <div class="clearfix">
                            <div class="h1">Quên Mật Khẩu</div>
                            <%
                                String message = (String)request.getAttribute("message");
                                if(message!=null)
                                {
                                    if(!message.equals(""))
                                    {%>
                                    <label class="text-warning"><%=message%></label>
                                    <%}
                                }
                                else
                                {
                            %>
                            <form class="form-inline" action="forgot" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="admin@abc.xyz">
                                </div>
                                <br>
                                *Lưu ý: Chúng tôi sẽ gửi mật khẩu mới về email của bạn
                                <br>

                                <button class="btn btn-lg btn-primary" value="submit">Xác Nhận</button>

                            </form>
                            <%
                                }
                            %>
                        </div>
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