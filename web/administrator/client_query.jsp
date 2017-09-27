<%-- 
    Document   : client_query
    Created on : Jun 6, 2017, 6:15:46 PM
    Author     : 420ShiftMarket
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Support</title>
        <%
            String s = (String) request.getSession().getAttribute("admin_id");
            if (s != null) {
                String msg = request.getParameter("msg");
        %>
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
                font-family: cambria;
                font-size: 18px;
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
                <%
                    try {
                        Connection con = DataBaseConn.getConnection();
                        PreparedStatement ps = con.prepareCall("select * from customer_support_client");
                        ResultSet rs = ps.executeQuery();
                        boolean emptyRs = true;
                        while (rs.next()) {
                            emptyRs = false;
                %>
                <tr>
                    <td rowspan="2"><%= rs.getString(3)%></td>
                    <td><%= rs.getString(1)%> / <%= rs.getString(2)%></td>
                    <%
                    if(rs.getString(5).equals("No")){
                    %>
                    <td rowspan="2"><input type="button" value="Reply" onclick="location.href = 'admin_reply.jsp?ci=<%=rs.getString(3)%>&cq=<%= rs.getString(4)%>&cd=<%= rs.getString(1)%>&ct=<%= rs.getString(2)%>'" /></td>
                    <%
                    }
                    %>
                </tr>
                <tr>
                    <td><%= rs.getString(4)%></td>
                </tr>
                <%
                    }
                    if (emptyRs) {
                %>
                <tr>
                    <td colspan="2">No Query From Customer</td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3"><input type="button" value="Back" onclick="location.href = 'admin_option.jsp'" /></td>
                </tr>
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
            response.sendRedirect("admin_login.jsp");
        }
    %>
</html>
