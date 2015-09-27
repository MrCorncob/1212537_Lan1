<%-- 
    Document   : usercp_edit
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
                        <%
                        
                            ArrayList<Order> orderList = new ArrayList<Order>();
                            try {
                                orderList = _factory.getOrderListByUserId(user.getId());
                                if (orderList.size()>0) {
                        %>
                        <h1>Lịch Sử Mua Hàng</h1>
                        <%
                                String message = (String)request.getAttribute("message");
                                if(message!=null)
                                {
                                    if(!message.equals(""))
                                    {%>
                                    <label class="text-warning"><%=message%></label>
                                    <%}
                                }
                        %>
                        <table class="table table-bordered table-responsive table-hover">
                            <thead>
                                <tr>
                                    <th>Ngày Đặt Hàng</th>
                                    <th>Sản Phẩm</th>
                                    <th>Thành Tiền</th>
                                    <th>Hình Thức Thanh Toán</th>
                                    <th>Trạng Thái Đơn Hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Order order : orderList) {
                                %>
                                <tr>
                                    <td><%=_factory.getTimeStringFromTimeStamp(order.getOrdered_time())%></td>
                                    <td>
                                        <ul>
                                            <%
                                                String[] productIds = order.getProduct().split(";");
                                                String[] quantities = order.getQuantity().split(";");
                                                int _count = productIds.length;
                                                for(int i=0; i<_count; i++)
                                                {
                                                    Product _product = _factory.getProductById(Integer.parseInt(productIds[i]));
                                                    out.println("<li>"+_product.getName()+" x "+quantities[i]+"</li>");
                                                }
                                                
                                            %>
                                        </ul>
                                    </td>
                                    <td><%=order.getAmount()+" VNĐ"%></td>
                                    <td><%=order.getPayment()%></td>
                                    <td><%=order.getStatus()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <%
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            

                        %>
                        
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