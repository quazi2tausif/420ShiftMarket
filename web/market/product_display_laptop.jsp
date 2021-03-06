<%-- 
    Document   : product_display_laptop
    Created on : May 31, 2017, 12:16:11 PM
    Author     : 420ShiftMarket
--%>

<%@page import="com.product.ShowCase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            if (ack != null) {
                String s = (String) request.getSession().getAttribute("client_id");
                String pd = request.getParameter("pro_id");
                request.getSession().setAttribute("pro_id", pd);
                String msg = request.getParameter("msg");
                ShowCase sc = new ShowCase();
                sc.laptop(pd);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=sc.pro_name%> Detail</title>
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
            .b1{
                border: 3px solid black;
                text-align: left;
                font-size: 22px;
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
        <li style="float: right;"><a href="../client/client_login.jsp?client_path=productdisplaylaptop&pro_id=<%= pd%>">Login</a></li>
            <%
                }
            %>
    </ul>
    <br>
    <div>
        <form action="../ProductPlacement">
            <%
                if (s == null) {
            %>
            <input type="hidden" name="login" value="productdisplaylaptop" />
            <%
                }
            %>
            <table style="float: left; width: 40%;">
                <tr>
                    <td colspan="2"><img src=<%=sc.pro_img%> alt=<%=sc.pro_name%> style="width: 100%;height: 320px;"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btn" value="ADD TO CART" style="width: 100%;height: 40px;"/></td>
                    <td><input type="submit" name="btn" value="BUY NOW" style="width: 100%;height: 40px;"/></td>
                </tr>
            </table>
            <table style="width: 50%; float: right;">
                <tr>
                    <td><%=sc.pro_name%></td>
                </tr>
                <tr>
                    <td>Price : <%=sc.pro_cost%></td>
                </tr>
                <tr>
                    <td>Quantity : <input list="quantity" name="quantity">
                        <datalist id="quantity">
                            <option value="1">
                            <option value="2">
                            <option value="3">
                            <option value="4">
                        </datalist>
                    </td>
                </tr>
                <%
                    if (msg != null) {
                %>
                <tr>
                    <td style="color: red;">Error while Submitting Query. Please try again.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
        <%
            try {
                Connection con = DataBaseConn.getConnection();
                PreparedStatement ps = con.prepareCall("select * from product_tech_detail_laptop where product_id=?");
                ps.setString(1, pd);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <div>
            <table>
                <tr>
                    <td colspan="2" class="b1">Product Technical Details : </td>
                </tr>
                <tr>
                    <td>Brand</td>
                    <td><%=rs.getString(2)%></td>
                </tr>
                <tr>
                    <td>Product Model Number</td>
                    <td><%=rs.getString(3)%></td>
                </tr>
                <tr>
                    <td>Product Color</td>
                    <td><%=rs.getString(4)%></td>
                </tr>
                <tr>
                    <td>Product Height</td>
                    <td><%=rs.getString(5)%></td>
                </tr>
                <tr>
                    <td>Product Width</td>
                    <td><%=rs.getString(6)%></td>
                </tr>
                <tr>
                    <td>Screen Size</td>
                    <td><%=rs.getString(7)%></td>
                </tr>
                <tr>
                    <td>Maximum Display Resolution</td>
                    <td><%=rs.getString(8)%></td>
                </tr>
                <tr>
                    <td>Item Weight</td>
                    <td><%=rs.getString(9)%></td>
                </tr>
                <tr>
                    <td>Product Dimensions</td>
                    <td><%=rs.getString(10)%></td>
                </tr>
                <tr>
                    <td>Processor Brand</td>
                    <td><%=rs.getString(11)%></td>
                </tr>
                <tr>
                    <td>Processor Type</td>
                    <td><%=rs.getString(12)%></td>
                </tr>
                <tr>
                    <td>Processor Speed</td>
                    <td><%=rs.getString(13)%></td>
                </tr>
                <tr>
                    <td>Processor Count</td>
                    <td><%=rs.getString(14)%></td>
                </tr>
                <tr>
                    <td>RAM Size</td>
                    <td><%=rs.getString(15)%></td>
                </tr>
                <tr>
                    <td>Memory Technology</td>
                    <td><%=rs.getString(16)%></td>
                </tr>
                <tr>
                    <td>Computer Memory Type</td>
                    <td><%=rs.getString(17)%></td>
                </tr>
                <tr>
                    <td>Hard Drive Size</td>
                    <td><%=rs.getString(18)%></td>
                </tr>
                <tr>
                    <td>Audio Details</td>
                    <td><%=rs.getString(19)%></td>
                </tr>
                <tr>
                    <td>Speaker Description</td>
                    <td><%=rs.getString(20)%></td>
                </tr>
                <tr>
                    <td>Graphics Coprocessor</td>
                    <td><%=rs.getString(21)%></td>
                </tr>
                <tr>
                    <td>Connectivity Type</td>
                    <td><%=rs.getString(22)%></td>
                </tr>
                <tr>
                    <td>Hardware Platform</td>
                    <td><%=rs.getString(23)%></td>
                </tr>
                <tr>
                    <td>Operating System</td>
                    <td><%=rs.getString(24)%></td>
                </tr>
                <tr>
                    <td colspan="2" class="b1">Warranty & Support : </td>
                </tr>
                <tr>
                    <td>Warranty, Parts</td>
                    <td>1 Year Limited</td>
                </tr>
                <tr>
                    <td>Warranty Details</td>
                    <td>1 year manufacturer warranty for device and 6 month manufacturer warranty for in-box accessories including batteries from the date of purchase.</td>
                </tr>
            </table>
        </div>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                response.sendRedirect("../acknowledgement.jsp");
            }
        %>    
    </body>
</html>
