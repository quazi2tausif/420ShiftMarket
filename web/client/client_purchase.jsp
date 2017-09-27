<%-- 
    Document   : client_purchase
    Created on : Jun 5, 2017, 1:58:52 PM
    Author     : 420ShiftMarket
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Purchase</title>
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            String client_id = (String) request.getSession().getAttribute("client_id");
            if (client_id != null) {
        %>
    </head>
    <style>
        body{
            background-color: royalblue;
        }
        table{
            border: 3px solid black;
            border-spacing: 5px;
            width: 100%;
            background-color: darkgoldenrod;
        }
        th,td{
            font-family: cambria;
            font-size: 18px;
            padding: 10px;
            text-align: center;
            background-color: white;
        }
        .logo{
            text-align: center;
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
            color: black;
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
            padding: 5px;
            font-family: cambria;
            font-size: 18px;
        }
    </style>
    <body>
        <div class="logo">
            <a href="../420market.jsp">
                <img src="../img/420.png" alt="420" style="width:96px;height:96px;"/>
                <img src="../img/Market.png" alt="Market" style="width:288px;height:96px;"/>
            </a>
        </div>
        <div>
            <ul>
                <li><a href="../420market.jsp">Home</a></li>
                <li><a href="../support/customer_care.jsp">24x7 Customer Support</a></li>
                <li><a href="client_cart.jsp">Your Cart</a></li>
                <li><a href="client_purchase.jsp">Your Purchase</a></li>
                <li><a href="../market/about_us.jsp">About Us</a></li>
                <li style="float: right;"><a href="../UserLogout">Logout</a></li>
                <li style="float: right;"><a href="#"><%= client_id%></a></li>
            </ul>
        </div>
        <br>
        <%
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement pscc, pscod;
                ResultSet rscc, rscod;
                pscc = con.prepareCall("select * from Payment_Done_Card where client_id=?");
                pscc.setString(1, client_id);
                rscc = pscc.executeQuery();
                HashSet<String> oidcc = new HashSet();
                while (rscc.next()) {
                    oidcc.add(rscc.getString(3));
                }
                String[] ord_idcc = oidcc.toArray(new String[oidcc.size()]);
        %>
        <div>
            <table>
                <tr>
                    <td style="font-size: 22px;" colspan="3">Your Purchase</td>
                </tr>
                <%
                    if (ord_idcc.length != 0) {
                        for (int i = 0; i < ord_idcc.length; i++) {
                %>
                <tr>
                    <td><%= ord_idcc[i]%></td>
                    <td><a href="client_bill.jsp?oid=<%= ord_idcc[i]%>" target="_blank">
                            <input type="button" value="View Bill" />
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="3">Its Lonely Here.</td>
                </tr>
                <%
                    }
                    pscod = con.prepareCall("select * from Payment_Through_COD where client_id=?");
                    pscod.setString(1, client_id);
                    rscod = pscod.executeQuery();
                    HashSet<String> oidcod = new HashSet();
                    while (rscod.next()) {
                        oidcod.add(rscod.getString(3));
                    }
                    String[] ord_idcod = oidcod.toArray(new String[oidcod.size()]);
                    for (int i = 0; i < ord_idcod.length; i++) {
                %>
                <tr>
                    <td><%= ord_idcod[i]%></td>
                    <td><a href="client_bill_2.jsp?oid=<%= ord_idcod[i]%>" target="_blank">
                            <input type="button" value="View Bill" />
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
    <%
        } else {
            response.sendRedirect("../420market.jsp");
        }
    %>
</html>
