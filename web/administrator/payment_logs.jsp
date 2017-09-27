<%-- 
    Document   : payment_logs
    Created on : Jun 2, 2017, 7:05:51 PM
    Author     : 420ShiftMarket
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String s = (String) request.getSession().getAttribute("admin_id");
            if (s != null) {
                String type1 = request.getParameter("cp_date");
                String type2 = request.getParameter("cod_date");
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps;
                boolean emptyRs = true;
        %>
        <title>
            <%
                if (type1 != null) {
            %>
            Card Payment Logs
            <%
            } else {
            %>
            COD Logs
            <%
                }
            %>
        </title>
        <style>
            body{
                background-color: royalblue;
            }
            table{
                width: 100%;
            }
            th,td{
                background-color: white;
                color: black;
            }           
            th,td{
                padding: 10px;
                text-align: center;
            }
            h3{
                color: white;
            }
            ul{
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333333; 
            }
            input{
                width: 100%;
                text-align: center;
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
            }
            div{
                font-family: cambria;
                font-size: 18px;
                color: white;
            }
            li{
                float: right;
            }
            li a:hover {
                background-color: #111111;
            }
        </style>
    </head>
    <body>
        <img src="../img/420.png" alt="420" style="width:64px;height:64px;"/>
        <img src="../img/Market.png" alt="Market" style="width:192px;height:64px;"/>
        <img src="../img/admin.png" alt="admin" style="height:64px;width:64px;"/>
        <ul>
            <li><a href="../AdminLogout">Logout</a></li>
            <li><a href="#"><%= s%></a></li>
        </ul>
        <br>
        <div>
            <table>
                <tr>
                    <td colspan="8">Date:
                        <%
                            if (type1 != null) {
                        %>
                        <%= type1%>
                        <%
                        } else {
                        %>
                        <%= type2%>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>Order Time</td>
                    <td>Client ID</td>
                    <td>Client Name</td>
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Product Quantity</td>
                    <td>Total Cost</td>
                    <td>Client Address</td>
                </tr>
                <%
                    if (type1 != null) {
                        ps = con.prepareCall("select * from Payment_Done_Card where order_date=?");
                        ps.setString(1, type1);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            emptyRs = false;
                %>
                <tr>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><%= rs.getString(9)%></td>
                </tr>
                <%
                    }
                    if (emptyRs) {
                %>
                <tr>
                    <td colspan="8">Payment through Card is Empty.</td>
                </tr>
                <%
                    }
                } else {
                    ps = con.prepareCall("select * from Payment_Through_COD where order_date=?");
                    ps.setString(1, type2);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        emptyRs = false;
                %>
                <tr>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><%= rs.getString(9)%></td>
                </tr> 
                <%
                    }
                    if (emptyRs) {
                %>
                <tr>
                    <td colspan="8">Payment through COD is Empty.</td>
                </tr>
                <%
                        }
                    }
                %>
                <tr>
                    <td colspan="8"><input type="button" value="Back" onclick="location.href = 'admin_option.jsp'" /></td>
                </tr>
            </table>
        </div>
    </body>
    <%
        } else {
            response.sendRedirect("AdminLogin.jsp");
        }
    %>
</html>

