<%-- 
    Document   : product
    Created on : May 10, 2015, 3:11:59 AM
    Author     : Corncob
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshopping.beans.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int _productId = 1;
    SQLServerFactory factory = new SQLServerFactory();
    DecimalFormat formatter = new DecimalFormat("###,###,###.##");
    try {
        _productId = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {

    }
    Product _product = factory.getProductById(_productId);

%>
<!DOCTYPE HTML>
<html>
    <head>
        <title><%=_product.getName()%></title>
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

                    <!-- left_menu.jsp-->
                    <%@ include file="leftbar.jsp" %>

                    <!-- content right-->
                    <div class="col-md-9 single_right">
                        <div class="single_top">
                            <div class="single_grid">
                                <div class="grid images_3_of_2">
                                    <ul style="display: block; width: 300px; height: 533px;" class="etalage" id="etalage">
                                        <li><img style="display: inline; width: 300px; height: 400px; opacity: 1;" class="etalage_thumb_image" src="images/product/<%=_product.getImageUrl()%>">

                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>		
                                </div> 
                                <div class="desc1 span_3_of_2">
                                    <h1><%=_product.getName()%></h1>
                                    <p class="availability"><span class="color">Còn hàng</span></p>
                                    <div class="price_single">
                                        <span class="actual"><%=formatter.format(_product.getPrice()) + " VNĐ"%></span>
                                    </div>
                                    <h2 class="quick">Mô Tả:</h2>
                                    <p class="quick_desc"><%=_product.getDescription()%></p>
                                    <span class="color">
                                        <label>Màu sắc: </label>
                                        <%=_product.getColor()%>
                                    </span>
                                    <div class="clearfix"></div>
                                    <div>
                                        <label>Size:</label>
                                        <ul class="form-inline size">
                                            <%
                                                String[] _sizes = _product.getSize().split(", ");
                                                for (String _size : _sizes) {
                                                    out.print("<li class=\"radio\"><label><input name=\"size\"  type=\"radio\">" + _size +"</label></li>");
                                                }
                                            %>
                                        </ul>
                                    </div>
                                        


                                    
                                    
                                    <form action="addtocart" method="post">
                                        <input name="id" type="hidden" value="<%=_productId%>">
                                    <div class="quantity_box">
                                        <ul class="product-qty">
                                            
                                            <span>Số Lượng:</span>
                                            <select class="form-control" name="quantity">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                            </select>
                                            
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <button  class="btn btn-primary btn-lg" value="submit">Thêm Vào Giỏ Hàng</button>
                                    </form>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>


                        <div class="clearfix"> </div>
                    </div> 
                </div>

            </div>  	    
        </div>
    </div>

    <!--footer-->
    <%@ include file="footer.jsp" %>

</body>
</html>		