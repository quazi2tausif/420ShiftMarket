<%-- 
    Document   : about_us
    Created on : Jun 4, 2017, 8:48:06 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <style>
            body{
                background-color: royalblue;
            }
            ul{
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333333; 
            }
            a{
                text-decoration: none;
            }
            li a {
                font-family: cambria;
                font-size: 18px;
                display: block;
                color: white;
                padding: 10px;
                text-decoration: none;
            }
            li{
                float: left;
            }
            li a:hover {
                background-color: #111111;
            }
            div{
                font-family: cambria;
                font-size: 18px;
                color: white;
                padding: 10px;
            }
        </style>
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            if (ack != null) {
                String s = (String) request.getSession().getAttribute("client_id");
        %>
    </head>
    <body>
    <center>
        <a href="../420market.jsp">
            <img src="../img/420.png" alt="420" style="width:96px;height:96px;"/>
            <img src="../img/Market.png" alt="Market" style="width:288px;height:96px;"/>
        </a>
    </center>
    <ul>
        <li><a href="../420market.jsp">Home</a></li>
            <%
                if (s != null) {
            %>
        <li><a href="../support/customer_care.jsp">24x7 Customer Support</a></li>
        <li><a href="client/client_cart.jsp">Your Cart</a></li>
        <li><a href="../client/client_purchase.jsp">Your Purchase</a></li>
        <li><a href="../market/about_us.jsp">About Us</a></li>
        <li style="float: right;"><a href="../ClientLogout">Logout</a></li>
        <li style="float: right;"><a href="#"><%= s%></a></li>
            <%
            } else {
            %>
        <li><a href="../client/client_login.jsp?client_path=customersupport">24x7 Customer Support</a></li>
        <li><a href="../client/client_login.jsp?client_path=cart">Your Cart</a></li>
        <li><a href="../client/client_login.jsp?client_path=yourpurchase">Your Purchase</a></li>
        <li><a href="../market/about_us.jsp">About Us</a></li>
        <li style="float: right;"><a href="../client/client_login.jsp?client_path=aboutus">Login</a></li>
            <%
                }
            %>
    </ul>
    <br>
    <div style="text-align: center;"><h1>About Us</h1></div>
    <div>
        - 420 Market is a digital company which includes all kinds of mobiles, laptops and televisions with an aim to offer variety of digital brands with best prices.<br>
        - We were the one of the top indian retailer for selling digital items and today we are spread across  60 cities with 560 stores .<br>
        - 420 Shift Market caters to the digital buyers with tech platform 420shiftmarket.in .<br>
        - Need not to be waiting for delivery, 420 Shift Market ensures to deliver your item within 2-3 days with value added services.<br>
        - 420 Shift Market gives variety of offers at the digital brands you choose, so that you can buy that item at affordable price.<br>
    </div>
</body>
<%
    } else {
        response.sendRedirect("../acknowledgement.jsp");
    }
%>
</html>
