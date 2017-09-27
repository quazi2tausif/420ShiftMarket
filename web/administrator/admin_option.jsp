<%-- 
    Document   : admin_option
    Created on : Jun 1, 2017, 7:47:26 PM
    Author     : 420ShiftMarket
--%>

<%@page import="com.administrator.AdminFail"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.databaseconn.DataBaseConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Option</title>
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
        <script src="../js/jquery-3.2.0.js"></script>
        <script>
            $(document).ready(function() {
                $("#f1").click(function() {
                    $(".p1").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f2").click(function() {
                    $(".p2").slideToggle("fast");
                    $(".p1").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f3").click(function() {
                    $(".p3").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f4").click(function() {
                    $(".p4").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f5").click(function() {
                    $(".p5").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f6").click(function() {
                    $(".p6").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f7").click(function() {
                    $(".p7").slideToggle("fast");
                    $(".p1").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f8").click(function() {
                    $(".p8").slideToggle("fast");
                    $(".p1").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f9").click(function() {
                    $(".p9").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f10").click(function() {
                    $(".p10").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f11").click(function() {
                    $(".p11").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p4").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f12").click(function() {
                    $(".p12").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f13").click(function() {
                    $(".p13").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f14").click(function() {
                    $(".p14").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f15").click(function() {
                    $(".p15").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p13").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f16").click(function() {
                    $(".p16").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f17").click(function() {
                    $(".p17").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p3").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p18").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f18").click(function() {
                    $(".p18").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p19").slideUp("fast");
                });
                $("#f19").click(function() {
                    $(".p19").slideToggle("fast");
                    $(".p2").slideUp("fast");
                    $(".p1").slideUp("fast");
                    $(".p5").slideUp("fast");
                    $(".p6").slideUp("fast");
                    $(".p7").slideUp("fast");
                    $(".p8").slideUp("fast");
                    $(".p9").slideUp("fast");
                    $(".p10").slideUp("fast");
                    $(".p11").slideUp("fast");
                    $(".p12").slideUp("fast");
                    $(".p14").slideUp("fast");
                    $(".p15").slideUp("fast");
                    $(".p16").slideUp("fast");
                    $(".p17").slideUp("fast");
                    $(".p18").slideUp("fast");
                });
                $("#fa").delay(10000).fadeOut(1);
            });
        </script>
        <%
            String s = (String) request.getSession().getAttribute("admin_id");
            if (s != null) {
                Connection con;
                PreparedStatement ps;
                boolean emptyRs = true;
                String failmsg = request.getParameter("msg");
        %>
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
                    <td id="f1">Admin Setting</td>
                    <td id="f2">Catalog Setting</td>
                    <td id="f3">Product Setting</td>
                    <td id="f4">Logs</td>
                    <td><a href="client_query.jsp">Customer Query</a></td>
                </tr>
            </table>
        </div>
        <div class="p1" hidden="true">Admin Setting
            <table>
                <tr>
                    <td id="f5">Add Admin</td>
                    <td id="f6">Remove Admin</td>
                </tr>
            </table>
        </div>
        <div class="p2" hidden="true">Catalog Setting
            <table>
                <tr>
                    <td id="f7">Add Catalog</td>
                    <td id="f8">Remove Catalog</td>
                </tr>
            </table>
        </div>
        <div class="p3" hidden="true">Product Setting
            <table>
                <tr>
                    <td id="f9">Add Product</td>
                    <td id="f10">Remove Product</td>
                    <td id="f11">Edit Price</td>
                    <td id="f19">Add Product Quantity</td>
                    <td id="f18">Add Product Details</td>
                </tr>
            </table>
        </div>
        <div class="p4" hidden="true">Logs
            <table>
                <tr>
                    <td id="f12">Admin Logs</td>
                    <td id="f13">Client Payment Log</td>
                    <td id="f14">Catalogs</td>
                    <td id="f15">Product Logs</td>
                </tr>
            </table>
        </div>
        <div class="p5" hidden="true">Add Admin
            <form action="../AddAdmin" method="post">
                <table>
                    <tr>
                        <td>ID Number :</td>
                        <td><input type="text" name="id_num"/></td>
                    </tr>
                    <tr>
                        <td>Admin Name :</td>
                        <td><input type="text" name="a_name"/></td>
                    </tr>
                    <tr>
                        <td>Admin ID :</td>
                        <td><input type="text" name="a_id"/></td>
                    </tr>
                    <tr>
                        <td>Admin Password :</td>
                        <td><input type="text" name="a_pass"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p6" hidden="true">Remove Admin
            <form action="../RemoveAdmin" method="post">
                <table>
                    <tr>
                        <td>Admin ID</td>
                        <td><input type="text" name="a_id"/></td>
                    </tr>
                    <tr>
                        <td>Admin Password</td>
                        <td><input type="text" name="a_pass"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p7" hidden="true"> Add Catalog
            <form action="../AddCatalog" method="post">
                <table>
                    <tr>
                        <td>Catalog ID</td>
                        <td><input type="text" name="cat_id"/></td>
                    </tr>
                    <tr>
                        <td>Catalog</td>
                        <td><input type="text" name="cat_name"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p8" hidden="true">Remove Catalog
            <form action="../RemoveCatalog" method="post">
                <table>
                    <tr>
                        <td>Catalog ID</td>
                        <td><input type="text" name="cat_id"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p9" hidden="true">Add Product
            <form action="../AddProduct" method="post">
                <table>
                    <tr>
                        <td>Catalog ID</td>
                        <td><input type="text" name="cat_id"/></td>
                    </tr>
                    <tr>
                        <td>Product ID</td>
                        <td><input type="text" name="pro_id"/></td>
                    </tr>
                    <tr>
                        <td>Product Name</td>
                        <td><input type="text" name="pro_name"/></td>
                    </tr>
                    <tr>
                        <td>Product Cost</td>
                        <td><input type="text" name="pro_cost"/></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="pro_quan"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p10" hidden="true">Remove Product
            <form action="../RemoveProduct" method="post">
                <table>
                    <tr>
                        <td>Product ID</td>
                        <td><input type="text" name="pro_id"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p11" hidden="true">Edit Price
            <form action="../EditPrice" method="post">
                <table>
                    <tr>
                        <td>Product ID</td>
                        <td><input type="text" name="pro_id"/></td>
                    </tr>
                    <tr>
                        <td>Product Cost</td>
                        <td><input type="text" name="pro_cost"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p12" hidden="true">Admin Logs
            <table>
                <tr>
                    <td>ID Number</td>
                    <td>Admin Name</td>
                    <td>Admin ID</td>
                    <td>Admin Password</td>
                </tr>
                <%
                    try {
                        con = DataBaseConn.getConnection();
                        ps = con.prepareCall("select * from administrator");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div class="p13" hidden="true">Client Payment Logs
            <table>
                <tr>
                    <td id="f16">Card Payment</td>
                    <td id="f17">COD</td>
                    <td id="f18">Internet Banking</td>
                </tr>
            </table>
        </div>
        <div class="p14" hidden="true">Catalogs
            <table>
                <tr>
                    <td>Catalog ID</td>
                    <td>Catalogs</td>
                </tr>
                <%
                    try {
                        con = DataBaseConn.getConnection();
                        ps = con.prepareCall("select * from product_catalog");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            emptyRs = false;
                %>
                <tr>
                    <td> <%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                </tr>
                <%
                    }
                    if (emptyRs) {
                %>
                <tr>
                    <td colspan="4">Product Catalog is Empty.</td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div class="p15" hidden="true">Product Logs
            <table>
                <tr>
                    <td>Catalog ID</td>
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Product Cost</td>
                    <td>Quantity</td>
                </tr>
                <%
                    try {
                        con = DataBaseConn.getConnection();
                        ps = con.prepareCall("select * from product");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            emptyRs = false;
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                </tr>
                <%
                    }
                    if (emptyRs) {
                %>
                <tr>
                    <td colspan="4">Product Log is Empty.</td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div class="p16" hidden="true">Card Payment
            <form action="payment_logs.jsp" method="post">
                <table>
                    <tr>
                        <td>Date :</td>
                        <td><input type="date" name="cp_date"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p17" hidden="true">COD
            <form action="payment_logs.jsp" method="post">
                <table>
                    <tr>
                        <td>Date :</td>
                        <td><input type="date" name="cod_date"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p18" hidden="true"> Add Product Details
            <form action="add_product_detail.jsp" method="post">
                <table>
                    <tr>
                        <td>Catalog ID</td>
                        <td><input type="text" name="cat_id"/></td>
                    </tr>
                    <tr>
                        <td>Product ID</td>
                        <td><input type="text" name="pro_id"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="p19" hidden="true"> Add Product Quantity
            <form action="../AddProductQuantity" method="post">
                <table>
                    <tr>
                        <td>Product ID</td>
                        <td><input type="text" name="pro_id"/></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="pro_quan"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <%
            if (failmsg != null) {
                AdminFail af = new AdminFail();
                af.fail(failmsg);
        %>
        <div style="text-align: center;" id="fa">
            <%= af.msg%>
        </div>
        <%
            }
        %>
    </body>
    <%
        } else {
            response.sendRedirect("admin_login.jsp");
        }
    %>
</html>

