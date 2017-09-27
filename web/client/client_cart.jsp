<%-- 
    Document   : client_cart
    Created on : Jun 4, 2017, 8:11:47 AM
    Author     : 420ShiftMarket
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.product.ShowCase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            String client_id = (String) request.getSession().getAttribute("client_id");
            if (client_id != null) {
                boolean emptyRs = true;
        %>
        <title>Cart</title>
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
    </head>
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
        <div>
            <table>
                <tr>
                    <td colspan="5" style="border: 3px solid black;">In Your Cart :</td>
                </tr>
                <tr>
                    <td></td>
                    <td>Product Name</td>
                    <td>Quantity</td>
                    <td>Total Price</td>
                    <td></td>
                </tr>
                <%
                    ShowCase sc = new ShowCase();
                    try {
                        Connection con = DataBaseConn.getConnection();
                        PreparedStatement ps = con.prepareCall("select * from client_add_to_cart where client_id=?");
                        ps.setString(1, client_id);
                        ResultSet rs = ps.executeQuery();
                        List<Integer> total_cost = new ArrayList();
                        List<String> name = new ArrayList();
                        List<String> product_id = new ArrayList();
                        List<String> product_quan = new ArrayList();
                        while (rs.next()) {
                            emptyRs = false;
                            sc.smart_phone(rs.getString(4));
                            sc.laptop(rs.getString(4));
                            sc.smart_tv(rs.getString(4));
                            int amt = Integer.parseInt(rs.getString(7));
                            total_cost.add(amt);
                            name.add(rs.getString(5));
                            product_id.add(rs.getString(4));
                            product_quan.add(rs.getString(6));
                %>
                <tr>
                    <td><img src="../market/<%= sc.pro_img%>" <%= sc.img_res%>/></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><a href="../RemoveCart?date=<%= rs.getString(1)%>&time=<%= rs.getString(2)%>">
                            <input type="button" value="Remove"/>
                        </a>
                    </td>
                </tr>
                <%
                    }
                    if (emptyRs) {
                %>
                <tr>
                    <td colspan="5">Its Lonely Here. Your Cart is Empty.</td>
                </tr>
                <%
                } else {
                    String pro_id = String.valueOf(product_id);
                    String pro_name = String.valueOf(name);
                    String quan = String.valueOf(product_quan);
                    int size = total_cost.size();
                    int amt = 0;
                    for (int i = 0; i < size; i++) {
                        amt += total_cost.get(i);
                    }
                    String t_amt = String.valueOf(amt);
                    request.getSession().setAttribute("pro_id", pro_id);
                    request.getSession().setAttribute("pro_name", pro_name);
                    request.getSession().setAttribute("quan", quan);
                    request.getSession().setAttribute("t_amt", t_amt);
                    request.getSession().setAttribute("atc", "atc");
                %>
                <tr>
                    <td colspan="3">Total</td>
                    <td><%=amt%></td>
                    <td><a href="client_address.jsp">
                            <input type="button" value="Buy" />
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <tr>
                    <td colspan="5" style="border: 3px solid black;">
                        <a href="../420market.jsp">
                            <input type="button" value="Continue Shopping" />
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
    <%
        } else {
            response.sendRedirect("client_login.jsp?client_path=cart");
        }
    %>
</html>
