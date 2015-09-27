<%-- 
    Document   : usercp
    Created on : May 11, 2015, 11:45:52 PM
    Author     : Corncob
--%>
<%@page import="com.onlineshopping.beans.Product"%>
<%@page import="com.onlineshopping.model.SQLServerFactory"%>
<%@page import="com.onlineshopping.beans.Order"%>
<%@page import="com.onlineshopping.beans.User"%>
<%
    User user = (User) session.getAttribute("user");
    SQLServerFactory _factory = new SQLServerFactory();
    if (user == null) {
        String site = new String("login.jsp");
        response.sendRedirect(site);
        return;
    }
    //else{
    String name = user.getFirstName() + user.getLastName();
    String action = request.getParameter("action");
    String _gender = user.getGender() == true ? "Nữ" : "Nam";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h1>Thông tin cá nhân</h1><br>
                        <table class="table table-bordered table-hover table-striped table-responsive">
                            <colgroup>
                                <col style="width: 30%">
                                <col style="width: 70%">
                            </colgroup>
                            <tr>
                                <td>Tên Đăng Nhập:</td>
                                <td><%=user.getUsername()%></td>
                            </tr>
                            <tr>
                                <td>Họ Tên: </td>
                                <td><%= user.getFirstName() + " " + user.getLastName()%></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><%=user.getEmail()%></td>
                            </tr>
                            <tr>
                                <td>Giới Tính:</td>
                                <td><%=_gender%></td>
                            </tr>
                            <tr>
                                <td>Ngày Sinh:</td>
                                <td><%=user.getBirthDay()%></td>
                            </tr>
                            <tr>
                                <td>Số Điện Thoại:</td>
                                <td><%=user.getPhone()%></td>
                            </tr>
                            <tr>
                                <td>Địa Chỉ:</td>
                                <td><%=user.getAddress()%></td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
        <%@ include file="footer.jsp" %>

    </body>
</html>	
