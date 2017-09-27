<%-- 
    Document   : client_bill_
    Created on : Jun 9, 2017, 7:49:56 PM
    Author     : 420ShiftMarket
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Bill</title>
        <style>
            table, td{
                border: 2px solid black;
                padding: 10px;
                font-family: cambria;
                font-size: 18px;
            }
            div{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="logo">
            <img src="../img/420.png" alt="420" style="width:96px;height:96px;"/>
            <img src="../img/Market.png" alt="Market" style="width:288px;height:96px;"/>
        </div>
        <br>
        <div>
            <center>
                <table>
                    <%
                        String client_id = (String) request.getSession().getAttribute("client_id");
                        String ord_id = request.getParameter("oid");
                        try {
                            Connection con = DataBaseConn.getConnection();
                            PreparedStatement ps = con.prepareCall("select * from Payment_Through_COD where client_id=? and order_id=?");
                            ps.setString(1, client_id);
                            ps.setString(2, ord_id);
                            ResultSet rs = ps.executeQuery();
                            HashSet<String> odate = new HashSet();
                            HashSet<String> clname = new HashSet();
                            HashSet<String> total = new HashSet();
                            HashSet<String> address = new HashSet();
                            List opro = new ArrayList();
                            while (rs.next()) {
                                odate.add(rs.getString(1));
                                clname.add(rs.getString(5));
                                total.add(rs.getString(9));
                                address.add(rs.getString(10));
                                opro.add(rs.getString(7));
                            }
                            String[] ord_datecc = odate.toArray(new String[odate.size()]);
                            String[] clnacc = clname.toArray(new String[clname.size()]);
                            String[] addcc = address.toArray(new String[address.size()]);
                            String[] tcc = total.toArray(new String[total.size()]);
                            for (int i = 0; i < ord_datecc.length; i++) {
                    %>
                    <tr>
                        <td>Order ID</td>
                        <td><%= ord_id%></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><%= ord_datecc[i]%></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%= clnacc[i]%></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td>Product</td>
                        <td>
                            <%
                                for (int i = 0; i < opro.size(); i++) {
                                    int j = i + 1;
                                    out.println(j + ". " + opro.get(i) + "<br>");
                                }
                            %>
                        </td>
                    </tr>
                    <%
                        for (int i = 0; i < ord_datecc.length; i++) {
                    %>
                    <tr>
                        <td>Total Amount</td>
                        <td>Rs. <%= tcc[i]%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%= addcc[i]%></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
                <br>
                <input type="button" value="Print" onclick="window.print();"/>
            </center>
        </div>
    </body>
</html>
