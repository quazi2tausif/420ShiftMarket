<%-- 
    Document   : laptop
    Created on : Jun 4, 2017, 8:02:02 AM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laptop Section</title>
        <style>
            body{
                background-color: royalblue;
            }
            table{
                border: 3px solid black;
                border-spacing: 5px;
                width: 50%;
                background-color: darkgoldenrod;
            }
            th,td{
                font-family: cambria;
                font-size: 18px;
                padding: 10px;
                text-align: center;
                background-color: white;
            }
            .b1{
                border: 3px solid black;
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
        <li><a href="../client/client_cart.jsp">Your Cart</a></li>
        <li><a href="../client/client_purchase.jsp">Your Purchase</a></li>
        <li><a href="about_us.jsp">About Us</a></li>
        <li style="float: right;"><a href="../ClientLogout">Logout</a></li>
        <li style="float: right;"><a href="#"><%= s%></a></li>
            <%
            } else {
            %>
        <li><a href="../client/client_login.jsp?client_path=customersupport">24x7 Customer Support</a></li>
        <li><a href="../client/client_login.jsp?client_path=cart">Your Cart</a></li>
        <li><a href="../client/client_login.jsp?client_path=yourpurchase">Your Purchase</a></li>
        <li><a href="about_us.jsp?client_path=aboutus">About Us</a></li>
        <li style="float: right;"><a href="../client/client_login.jsp?client_path=laptop">Login</a></li>
            <%
                }
            %>
    </ul>
    <br>
    <table style="width:100%;">
        <tr>
            <th class="b1">Laptop</th>
            <th class="b1">Name</th>
            <th class="b1">Price</th>
            <th class="b1">Laptop</th>
            <th class="b1">Name</th>
            <th class="b1">Price</th>
        </tr>
        <tr>
            <td><a href="product_display_laptop.jsp?pro_id=201">                
                    <img src="img/laptop/macbook.jpeg" alt="macbook" height="139" width="220"/>
                </a>
            </td>
            <td>Apple MacBook Air Core i5 5th Gen</td>
            <td>Rs. 55,995</td>
            <td><a href="product_display_laptop.jsp?pro_id=202">                
                    <img src="img/laptop/imprint.jpeg" alt="imprint" height="139" width="220"/>
                </a>
            </td>
            <td>HP Core i7 6th Gen</td>
            <td>Rs. 56,990</td>
        </tr>
        <tr>
            <td><a href="product_display_laptop.jsp?pro_id=203">
                    <img src="img/laptop/ideapad.jpeg" alt="ideapad" height="139" width="220"/>
                </a>
            </td>
            <td>HP APU Quad Core A8 6th Gen</td>
            <td>Rs. 25,990</td>
            <td><a href="product_display_laptop.jsp?pro_id=204">
                    <img src="img/laptop/notebook.jpeg" alt="notebook" height="139" width="220"/>
                </a>
            </td>
            <td>Lenovo 310 Core i5 6th Gen</td>
            <td>Rs. 41,990</td>
        </tr>
    </table>
</body>
<%
    } else {
        response.sendRedirect("../acknowledgement.jsp");
    }
%>
</html>

