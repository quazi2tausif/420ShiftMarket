<%-- 
    Document   : customer_care
    Created on : Jun 4, 2017, 6:47:24 PM
    Author     : 420ShiftMarket
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>24x7 Customer Support</title>
        <style>
            body{
                background-color: royalblue;
            }
            table{
                border: 3px solid black;
                border-spacing: 5px;
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
            input{
                padding: 10px;
                font-family: cambria;
                font-size: 18px;
            }
        </style>
        <script src="../js/jquery-3.2.0.js"></script>
        <script>
            $(document).ready(function() {
                $("#fc").delay(10000).fadeOut(1);
            });
        </script>
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            String s = (String) request.getSession().getAttribute("client_id");
            if (s != null) {
                Connection con;
                PreparedStatement psc, psa;
                ResultSet rsc, rsa;
                boolean emptyRs = true;
                String failmsg = request.getParameter("msg");
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
        <li><a href="customer_care.jsp">24x7 Customer Support</a></li>
        <li><a href="client/client_cart.jsp">Your Cart</a></li>
        <li><a href="../market/about_us.jsp">About Us</a></li>
        <li style="float: right;"><a href="../ClientLogout">Logout</a></li>
        <li style="float: right;"><a href="#"><%= s%></a></li>
    </ul>
    <br>
    <div style="color: white; text-align: center;">
        <h1>24x7 Customer Support</h1>
    </div>
    <%
        try {
            con = DataBaseConn.getConnection();
            psc = con.prepareCall("select * from customer_support_client");
            rsc = psc.executeQuery();
            while (rsc.next()) {
                emptyRs = false;
                if (!emptyRs) {
    %>
    <div>
        <table style="width: 100%;">
            <tr>
                <td rowspan="2" style="width: 20%;"><img src="img/client.png"/><br><%= rsc.getString(3)%></td>
                <td><%= rsc.getString(1)%> / <%= rsc.getString(2)%></td>
            </tr>
            <tr>
                <td><%= rsc.getString(4)%></td>
            </tr>
        </table>
    </div>
    <%
            }
        }
        psa = con.prepareCall("select * from admin_reply");
        rsa = psa.executeQuery();
        while (rsa.next()) {
            emptyRs = false;
            if (!emptyRs) {
    %>
    <div>
        <table style="width: 100%;">
            <tr>
                <td rowspan="3" style="width: 20%;"><img src="img/admin.png"/><br>Administrator</td>
                <td><%= rsa.getString(1)%> / <%= rsa.getString(2)%></td>
            </tr>
            <tr>
                <td style="color: grey;">From <%= rsa.getString(3)%>,<br>
                    <%= rsa.getString(4)%></td>
            </tr>
            <tr>
                <td><%= rsa.getString(5)%></td>
            </tr>
        </table>
    </div>
    <%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <br>
    <div>
        <form action="../CustomerSupport" method="post">
            <table style="width: 50%;">
                <tr>
                    <td>Email ID</td>
                    <td><%= s%></td>
                </tr>
                <tr>
                    <td rowspan="2">Enquiry</td>
                    <td style="font-size: 15px;">Word limited to 140 characters.</td>
                </tr>
                <tr>
                    <td><textarea rows="2" cols="30" name="enquiry" style="height: 87px; width: 100%;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit" /><input type="button" value="Reset" onclick="this.form.elements['enquiry'].value = ''"></td>
                </tr>
                <%
                    if (failmsg != null) {
                %>
                <div style="color: red; text-align: center;" class="fc">Enquiry Failed.Please Try Again.</div>
                <%
                    }
                %>
            </table>
        </form>
    </div>
</body>
<%
    } else {
        response.sendRedirect("../client/client_login.jsp?client_path=customersupport");
    }
%>
</html>
