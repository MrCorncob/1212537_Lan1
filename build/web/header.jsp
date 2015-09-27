<%@page import="java.util.ArrayList"%>
<%-- 
    Document   : header
    Created on : May 10, 2015, 10:50:54 PM
    Author     : Corncob
--%>
<%@page import="com.onlineshopping.POJO.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header">
    <div class="header_top">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo.png" alt=""/></a>
            </div>
            <ul class="shopping_grid">
                <%
                    String _loginStatus = (String) session.getAttribute("loginStatus");
                    if (_loginStatus == null || _loginStatus != "success") {
                        out.print("<a href=\"register.jsp\"><li>Đăng Kí</li></a>");
                        out.print("<a href=\"login.jsp\"><li>Đăng Nhập</li></a>");
                    } else {
                        User _user = (User) (session.getAttribute("user"));
                        String _username = _user.getFullname();
                        out.print("<a href=\"logout.jsp\"><li>Đăng Xuất</li></a>");
                        out.print("<a href=\"usercp.jsp\"><li>" + _username + "</li></a>");
                    }
                %>

                <a href="#"><li><span class="m_1">Giỏ Hàng</span>&nbsp;&nbsp;(0) &nbsp;<img src="images/bag.png" alt=""/></li></a>
                <div class="clearfix"> </div>
            </ul>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="h_menu4"><!-- start h_menu4 -->
        <div class="container">
            <a class="toggleMenu" href="#">Menu</a>
            <ul class="nav">
                <li class="active"><a href="index.jsp" data-hover="Home">Trang Chủ</a></li>
                <li><a href="about.jsp" data-hover="Thông Tin">Thông Tin</a></li>
                <li><a href="contact.jsp" data-hover="Liên Hệ">Liên Hệ</a></li>
                <li><a href="service.jsp" data-hover="Dịch Vụ">Dịch Vụ</a></li>
                <li><a href="http://daiyen.info" data-hover="DaiYen.info" target="_blank">DaiYen.info</a></li>
            </ul>
            <script type="text/javascript" src="js/nav.js"></script>
        </div><!-- end h_menu4 -->
    </div>
</div>
<div class="column_center">
    <div class="container">
        <div class="search">
            <div class="stay">Tìm Kiếm Sản Phẩm Theo</div>
            <div >
                <form class="form-inline" action="search.jsp" method="get">
                    <span>
                        <label>
                            Màu Sắc
                        </label>
                        <select class="form-control" name="color">
                            <option value="">Bất Kì</option>
                            <option>Đỏ</option>
                            <option>Cam</option>
                            <option>Vàng</option>
                            <option>Lục</option>
                            <option>Lam</option>
                            <option>Chàm</option>
                        </select>
                    </span>
                    <span>
                        <label>
                            Kích Thước
                        </label>
                        <select class="form-control" name="size">
                            <option value="">Bất Kì</option>
                            <option>S</option>
                            <option>M</option>
                            <option>L</option>
                            <option>XL</option>
                        </select>
                    </span>
                    <span>
                        <label>
                            Giá Bán
                        </label>
                        <select class="form-control" name="price">
                            <option value="">Bất Kì</option>
                            <option>&lt;100.000</option>
                            <option>100.000 - 200.000</option>
                            <option>200.000 - 300.000</option>
                            <option>&gt;300.000</option>
                        </select>
                    </span>
                    <span>
                        <label>
                            Nhà Cung Cấp
                        </label>
                        <select class="form-control" name="manufacture">
                            <option value="">Bất Kì</option>
                            <option>Ma Bư</option>
                        </select>
                    </span>
                    <input type="submit" value=""> 
                </form>

            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>