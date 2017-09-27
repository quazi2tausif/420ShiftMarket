<%-- 
    Document   : client_address
    Created on : Jun 4, 2017, 8:12:39 AM
    Author     : 420ShiftMarket
--%>

<%@page import="com.client.ClientPath"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address Conformation</title>
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            String client_id = (String) request.getSession().getAttribute("client_id");
            if (client_id != null) {
                String pro_id = (String) request.getSession().getAttribute("pro_id");
                String pro_name = (String) request.getSession().getAttribute("pro_name");
                String quan = (String) request.getSession().getAttribute("quan");
                String t_amt = (String) request.getSession().getAttribute("t_amt");
                String atc = (String) request.getSession().getAttribute("atc");
                ClientPath cp = new ClientPath();
                cp.client_address_atc(atc, pro_id, pro_name, quan);
        %>
        <style>
            div{
                font-family: cambria;
                border-radius: 10px;                
            }
            .titel{
                text-align: center;
                font-size: 30px;
                color: white;
                background-color: #333333;
                padding: 20px;
            }
            div table{
                width: 45%;
                text-align: center;
                border: 3px solid black;
            }
            td{
                padding: 10px;
                font-size: 18px;
                border: 3px solid black;
            }
            textArea{
                width: 100%;
                font-family: cambria;
                font-size: 16px;
            }
            a{
                text-decoration: none;
            }
            input{
                font-family: cabbria;
                font-size: 18px;
            }
        </style>
        <script src="../js/jquery-3.2.0.js"></script>
        <script>
            $(document).ready(function() {
                $("#oldadd").click(function() {
                    $("#newadd").fadeToggle("slow");
                });
            });
        </script>
    </head>
    <body>
        <div class="titel">
            <b>Dummy Payment</b>
        </div><br>
        <%
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("select * from userinfo where user_id = ?");
                ps.setString(1, client_id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>

        <div>
            <table style="float: left;">
                <tr>
                    <th>Product Id</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Total Cost</th>
                </tr>
                <tr>
                    <td><%= cp.proid%></td>
                    <td><%= cp.proname%></td>
                    <td><%= cp.proquan%></td>
                    <td>Rs. <%= t_amt%></td>
                </tr>
                <tr>
                    <th colspan="4">Deliver Address</th>
                </tr>
                <tr>
                    <td colspan="4"><%= rs.getString(5)%><br><input type="button" value="Edit" id="oldadd"  style="float: right;"/></td>
                </tr>
                <tr>
                    <td colspan="4"><a href="../payment/payment_type.jsp">
                            <input type="button" value="Submit"/>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
        <div hidden="true" id="newadd">
            <form action="../ChangeAddress">
                <table style="float: right;">
                    <tr>
                        <th>Old Address</th>
                        <th>New Address</th>
                    </tr>
                    <tr>
                        <td><%= rs.getString(5)%></td>
                        <td><textarea name="newadd"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect("../420market.jsp");
            }
        %>
    </body>
</html>

