<%-- 
    Document   : 420market
    Created on : May 30, 2017, 5:37:58 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            if (ack != null) {
                String s = (String) request.getSession().getAttribute("client_id");
        %>
        <title>Welcome To 420Market</title>
        <style>
            body{
                background-color: royalblue;
            }
            td{
                padding: 15px;
            }
            ul{
                margin: 0;
                padding: 0;
                overflow: hidden;
                list-style-type: none;
            }
            .text_formate{
                font-family: cambria;
                font-size: 18px;
                color: white;
            }
            .u1{
                background-color: #333333; 
            }
            .l1 a {
                font-family: cambria;
                font-size: 18px;
                display: block;
                color: white;
                padding: 10px;
                text-decoration: none;
            }
            .l2 a{
                font-family: cambria;
                font-size: 18px;
                display: block;
                color: white;
                padding: 10px;
                text-decoration: none;
            }
            .l2{
                float: left;
            }
            .l1{
                float: right;
            }
            .l1 a:hover {
                background-color: #111111;
            }
            .l2 a:hover {
                background-color: #111111;
            }
            .text{
                font-family: cambria;
                font-size: 18px;
                display: block;
                color: white;
                padding: 10px;
            }
        </style>
        <script src="js/jquery-3.2.0.js"></script>
        <script>
            $(function() {
                $("#img_flip").css({
                    "height": $("#img_flip li:first").css("height"),
                    "overflow": "hidden"
                });
                function showimg() {
                    $("#img_flip li:first").delay(5000).slideUp(1000, function() {
                        var $this = $(this);
                        $this.parent().append(this);
                        $this.show();
                        showimg();
                    });
                }
                showimg();
            });
        </script>
        <script>
            $(function() {
                $("#img_flip1").css({
                    "height": $("#img_flip1 li:first").css("height"),
                    "overflow": "hidden"
                });
                function showimg() {
                    $("#img_flip1 li:first").delay(5000).slideUp(1000, function() {
                        var $this = $(this);
                        $this.parent().append(this);
                        $this.show();
                        showimg();
                    });
                }
                showimg();
            });
        </script>
    </head>
    <body>
    <center>
        <div style="padding: 10px;">
            <a href="420market.jsp" style="text-decoration: none;">
                <img src="img/420.png" alt="420" style="width:96px;height:96px;"/>
                <img src="img/Market.png" alt="Market" style="width:288px;height:96px;"/>
            </a>
        </div>
    </center>
    <ul class="u1">
        <%
            if (s != null) {
        %>
        <li class="l1"><a href="ClientLogout">Logout</a></li>
        <li class="l1"><a href="#"><%= s%></a></li>
        <li class="l2"><a href="support/customer_care.jsp">24x7 Customer Support</a></li>
        <li class="l2"><a href="client/client_cart.jsp">Your Cart</a></li>
        <li class="l2"><a href="client/client_purchase.jsp">Your Purchase</a></li>
        <li class="l2"><a href="market/about_us.jsp">About Us</a></li>
            <%
            } else {
            %>
        <li class="l1"><a href="client/client_registration.jsp">Registration</a></li>
        <li class="l1"><a href="client/client_login.jsp?client_path=420market">Login</a></li>
        <li class="l2"><a href="client/client_login.jsp?client_path=customersupport">24x7 Customer Support</a></li>
        <li class="l2"><a href="client/client_login.jsp?client_path=cart">Your Cart</a></li>
        <li class="l2"><a href="client/client_login.jsp?client_path=yourpurchase">Your Purchase</a></li>
        <li class="l2"><a href="market/about_us.jsp?client_path=aboutus">About Us</a></li>
            <%
                }
            %>
    </ul>
    <br>
    <br>
    <div id="img_flip" style="float: left;">
        <div class="text">Smart Phone : </div>
        <ul>
            <a href="market/smart_phone.jsp">
                <li><img src="img/phone_banner/ph1.jpg" alt="ph1" style="width: 920px; height: 270px;"/></li>
                <li><img src="img/phone_banner/ph2.png" alt="ph2" style="width: 920px; height: 270px;"/></li>
                <li><img src="img/phone_banner/ph3.jpg" alt="ph3" style="width: 920px; height: 270px;"/></li>
            </a>
        </ul>
    </div>
    <div id="img_flip1" style="float: left; padding-top: 20px;">
        <div class="text">Laptop : </div>
        <ul>
            <a href="market/laptop.jsp">
                <li><img src="img/laptop_banner/l.jpg" alt="1" style="width: 920px; height: 270px;"/></li>
                <li><img src="img/laptop_banner/l1.jpeg" alt="11" style="width: 920px; height: 270px;"/></li>
                <li><img src="img/laptop_banner/l2.jpeg" alt="11" style="width: 920px; height: 270px;"/></li>
                <li><img src="img/laptop_banner/l3.jpeg" alt="11" style="width: 920px; height: 270px;"/></li>
            </a>
        </ul>
    </div>
    <div style="float: left; padding-top: 20px;">
        <div class="text">Smart Television : </div>
        <ul>
            <a href="market/smart_tv.jsp">
                <li><img src="img/tv_banner/t1.png" alt="t1" style="width: 920px; height: 250px;"/></li>
            </a>
        </ul>
    </div>
</body>
<%
    } else {
        response.sendRedirect("acknowledgement.jsp");
    }
%>
</html>
