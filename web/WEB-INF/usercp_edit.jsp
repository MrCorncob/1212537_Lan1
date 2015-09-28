<%-- 
    Document   : usercp
    Created on : May 11, 2015, 11:45:52 PM
    Author     : Corncob
--%>
<%@page import="com.onlineshopping.beans.Product"%>
<%@page import="com.onlineshopping.model.SQLServerFactory"%>
<%@page import="com.onlineshopping.beans.Order"%>
<%@page import="com.onlineshopping.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    SQLServerFactory _factory = new SQLServerFactory();
    if (user == null) {
        String site = new String("login.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    } else {
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>UserCP page</title>
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
            <div class="content_top">
                <div class="container">
                    <%--Left menu--%>
                    <div class="col-md-3 sidebar_box">
                        <div class="sidebar">
                            <div class="menu_box">
                                <h3 class="menu_head">Bảng Điểu Khiển</h3>
                                <ul class="menu">
                                    <li class="item1">
                                        <a href="usercp.jsp">
                                            <img class="arrow-img" src="images/f_menu.png" alt=""/> 
                                            Thông Tin Tổng Quan
                                        </a>
                                    </li>
                                    <li class="item2">
                                        <a href="usercp_edit.jsp">
                                            <img class="arrow-img" src="images/f_menu.png" alt=""/>
                                            Chỉnh Sửa Thông Tin
                                        </a>
                                    </li>
                                    <li class="item3">
                                        <a href="usercp_viewhistory.jsp">
                                            <img class="arrow-img" src="images/f_menu.png" alt=""/>
                                            Xem Lịch Sử Mua Hàng
                                        </a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>

                    <%--Right Content--%>
                    <div class="col-md-9 content_right">
                        <div class="col-md-9 content_right">
                        <h1>Chỉnh sửa thông tin</h1>
                        <div class="register">
                            <form action="UpdateUserInfo" method="post"> 
                                <div class="register-bottom-grid">
                                    <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                                    <label>Vì lí do bảo mật, bạn phải nhập mật khẩu hiện tại để thực hiện thay đổi</label>
                                    <%
                                        String updateUserInfoStatus = (String) session.getAttribute("UpdateUserInfoStatus");
                                        if (updateUserInfoStatus != null) {
                                            out.print("<br><label style=\"color:red\">" + updateUserInfoStatus + "!</label></br>");
                                            session.setAttribute("UpdateUserInfoStatus", null);
                                        }
                                    %>
                                    <div class="clearfix"> </div>
                                    <div style="float:none">
                                        <span>Mật khẩu hiện tại<label>*</label></span>
                                        <input type="password" name="currentpassword">
                                    </div>
                                    <div>
                                        <span>Mật khẩu mới<label>(optional)</label></span>
                                        <input type="password" name="password">
                                    </div>
                                    <div>
                                        <span>Nhập lại mật khẩu mới<label>(optional)</label></span>
                                        <input type="password" name="repassword">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>

                                <div class="clearfix"> </div>
                                <div class="register-top-grid">
                                    <h3>THÔNG TIN CÁ NHÂN</h3>
                                    <div>
                                        <span>Họ<label>*</label></span>
                                        <input type="text" name="firstname" value="<%=user.getFirstName()%>"> 
                                    </div>
                                    <div>
                                        <span>Tên<label>*</label></span>
                                        <input type="text" name="lastname" value="<%=user.getLastName()%>"> 
                                    </div>
                                    <div>
                                        <span>Giới tính<label>*</label></span>
                                        <input type="radio" name="gender" value="male"<%=user.getGender() == false ? "checked" : ""%>><label>Nam</label>
                                        <input type="radio" name="gender" value="female" <%=user.getGender() == true ? "checked" : ""%>><label>Nữ</label>
                                    </div>
                                    <div>
                                        <span>Ngày sinh<label>*</label></span>
                                        <input type="text" name="birthday" value="<%=user.getBirthDay()%>" placeholder="yyyy-mm-dd" > 
                                    </div>
                                    <div>
                                        <span>Địa chỉ email<label>*</label></span>
                                        <input type="text" name="email" value="<%=user.getEmail()%>" > 
                                    </div>
                                    <div>
                                        <span>Số điện thoại<label>*</label></span>
                                        <input type="text" name="phone" value="<%=user.getPhone()%>"> 
                                    </div>
                                    <div>
                                        <span>Địa chỉ<label>*</label></span>
                                        <input type="text" name="address" value="<%=user.getAddress()%>"> 
                                    </div>
                                    <div class="clearfix"> </div>

                                </div>
                                <div class="clearfix"> </div>
                                <div class="register-but">
                                    <input type="submit" value="Lưu Thay Đổi">
                                    <div class="clearfix"> </div>
                                </div>
                            </form>

                        </div>
                        
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
        <%@ include file="footer.jsp" %>

    </body>
</html>	
<%    }
%>