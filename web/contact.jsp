<%-- 
    Document   : contact
    Created on : May 10, 2015, 3:11:59 AM
    Author     : Corncob
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshopping.beans.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat formatter = new DecimalFormat("###,###,###.##");
    ArrayList<Product> _productList = new ArrayList<Product>();
    String _title = "Danh sách sản phẩm ngẫu nhiên";
    SQLServerFactory _factory = new SQLServerFactory();
    _productList = _factory.getProductListByRandom(12);
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Liên Hệ</title>
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
        <%@ include file="slider.jsp" %>
        <!--header-->
        <div class="main">
            <div class="content_top">
                <div class="container">
                    
                    <!-- left_menu.jsp-->
                    <%@ include file="leftbar.jsp" %>

                    <!-- content right-->
                    <div class="col-md-9">
                        <h1>Sản Phẩm Ngẫu Nhiên</h1>

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
                                            <li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Mua Ngay">Mua Ngay</div></li>
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


                    </div>
                    
                </div>  	    
            </div>
        </div>

        <!--footer-->
        <%@ include file="footer.jsp" %>

    </body>
</html>		