<%-- 
    Document   : leftbar.jsp
    Created on : May 10, 2015, 10:55:07 PM
    Author     : Corncob
--%>
<%@page import="com.onlineshopping.POJO.OperatingSystem"%>
<%@page import="com.onlineshopping.POJO.Manufacture"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-3 sidebar_box">
                        <div class="sidebar">
                            <div class="menu_box">
                                <h3 class="menu_head">Danh Mục Sản Phẩm</h3>
                                <ul class="menu">
                                    <li><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Hãng Sản Xuất</a>
                                        <ul>
                                            <%
                                            for (Manufacture manufacture: manufactureList)
                                            {
                                                %>
                                                    <li><a href="./manufacture.html?id=<%=manufacture.getId()%>"><%=manufacture.getName()%></a></li>
                                                <%
                                            }
                                            %>
                                            
                                            
                                        </ul>
                                    </li>
                                    <li><a href="#"><img class="arrow-img" src="images/f_menu.png" alt=""/>Hệ Điều Hành</a>
                                        <ul>
                                            <%
                                            for (OperatingSystem os: osList)
                                            {
                                                %>
                                                    <li><a href="./operating-system.html?id=<%=os.getId()%>"><%=os.getName()%></a></li>
                                                <%
                                            }
                                            %>
                                            
                                            
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </div>
                            <!--initiate accordion-->
                            <script type="text/javascript">
            $(function () {
                var menu_ul = $('.menu > li > ul'),
                        menu_a = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });
                            </script>
                        </div>
                        <div class="corncob text-center">
                            <img src="images/corncob.png" class="img-responsive" alt=""/>
                            <h3>MrCorncob</h3>
                            
                        </div>
                        
                    </div>
