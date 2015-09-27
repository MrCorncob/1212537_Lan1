<%-- 
    Document   : search.jsp
    Created on : May 10, 2015, 3:11:59 AM
    Author     : Corncob
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshopping.beans.Category"%>
<%@page import="com.onlineshopping.model.SQLServerFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineshopping.beans.Product"%>
<%@page import="com.onlineshopping.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat formatter = new DecimalFormat("###,###,###.##");
    ArrayList<Product> _productList = new ArrayList<Product>();
    SQLServerFactory _factory = new SQLServerFactory();
    int _totalProductCount = 0;
    int _page = 0;
    int _pageCount = 0;
    String searchSize = "", searchColor = "", searchPrice = "", manufacture = "";
    int minPrice = 0, maxPrice = 0;
    try{
        _page = Integer.parseInt(request.getParameter("page"));
    }
    catch(Exception e ){
        _page=1;
    }
    try {
        searchSize = request.getParameter("size");
        searchColor = request.getParameter("color");
        searchPrice = request.getParameter("price");
        manufacture = request.getParameter("manufacture");
        if (searchPrice.equals("<100.000")) {
            minPrice = 0;
            maxPrice = 100000;
        } else if (searchPrice.equals("100.000 - 200.000")) {
            minPrice = 100000;
            maxPrice = 200000;
        } else if (searchPrice.equals("200.000 - 300.000")) {
            minPrice = 200000;
            maxPrice = 300000;
        } else if (searchPrice.equals(">300.000")) {
            minPrice = 300000;
            maxPrice = 999999;
        } else {
            minPrice = maxPrice = -1;
        }
        _productList = _factory.searchProduct(searchColor, searchSize, minPrice, maxPrice,manufacture,_page,15);
        _totalProductCount = _factory.searchProductCount(searchColor, searchSize, minPrice, maxPrice,manufacture);
        _pageCount = _totalProductCount / 15 + 1;
        if (_page < 1 || (_page - 1) * 15 > _totalProductCount) {
            _page = 1;
        }
    } catch (Exception e) {
    }

%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Tìm Kiếm Sản Phẩm</title>
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
                    <%@ include file="leftbar.jsp" %>
                    <div class="col-md-9">
                        <h2 class="text-info">Tìm thấy <%=_totalProductCount%> sản phẩm thỏa điều kiện</h2>
                        <%                            if (_totalProductCount > 0) {
                                out.println("<ul class=\"paging\">");
                                for (int i = 1; i < _pageCount + 1; i++) {
                                    if (i != _page) {
                                        out.println("<li class=\"arrow\"><a href=\"search.jsp?color=" + searchColor + "&size=" + searchSize + "&price=" + searchPrice + "&page=" + i +"&manufacture="+manufacture+ "\">" + i + "</a></li>");
                                    } else {
                                        out.println("<li><span>" + i + "</span></li>");
                                    }
                                }

                                out.println("</ul>");
                            }
                        %>
                        <div class="clearfix"></div>
                        <% for (Product _product : _productList) {%>
                        <div class="col-md-4 top_grid1-box1">
                            <a href="product.jsp?id=<%=_product.getId()%>">
                                <div class="grid_1">
                                    <div>
                                        <img src="images/product/<%=_product.getImageUrl()%>" class="img-responsive" alt=""/> </div>
                                    <div class="grid_2">
                                        <%=_product.getName()%>
                                        <ul class="grid_2-bottom">
                                            <li class="grid_2-left"><%=formatter.format(_product.getPrice()) + " VNĐ"%></li>
                                            <li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " title="Mua Ngay">Mua Ngay</div></li>
                                            <div class="clearfix"> </div>
                                        </ul>
                                    </div>
                                </div>
                            </a>

                        </div>
                        <%
                            }
                        %>


                        <div class="clearfix"> </div>                         
                        <%                            if (_totalProductCount > 0) {
                                out.println("<ul class=\"paging\">");
                                for (int i = 1; i < _pageCount + 1; i++) {
                                    if (i != _page) {
                                        out.println("<li class=\"arrow\"><a href=\"search.jsp?color=" + searchColor + "&size=" + searchSize + "&price=" + searchPrice + "&page=" + i +"&manufacture="+manufacture+ "\">" + i + "</a></li>");
                                    } else {
                                        out.println("<li><span>" + i + "</span></li>");
                                    }
                                }

                                out.println("</ul>");
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