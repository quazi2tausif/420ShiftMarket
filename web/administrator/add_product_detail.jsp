<%-- 
    Document   : add_product_detail_phone
    Created on : Jun 3, 2017, 12:05:24 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product Detail</title>
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
    <%
        String s = (String) request.getSession().getAttribute("admin_id");
        if (s != null) {
            String cat_id = request.getParameter("cat_id");
            String pro_id = request.getParameter("pro_id");
            String msg = request.getParameter("msg");
            request.getSession().setAttribute("pro_id", pro_id);
    %>
    <body>
        <img src="../img/420.png" alt="420" style="width:64px;height:64px;"/>
        <img src="../img/Market.png" alt="Market" style="width:192px;height:64px;"/>
        <img src="../img/admin.png" alt="admin" style="height:64px;width:64px;"/>
        <ul>
            <li><a href="../AdminLogout">Logout</a></li>
            <li><a href="#"><%= s%></a></li>
        </ul>
        <br>
        <%
            if (cat_id.equals("Pro_101")) {
        %>
        <div>
            <form action="../AddProductDetailPhone" method="post">
                <table>
                    <tr>
                        <td>Product ID</td>
                        <td><%= pro_id%></td>
                    </tr>
                    <tr>
                        <td>OS</td>
                        <td><input type="text" name="os" /></td>
                    </tr>
                    <tr>
                        <td>RAM</td>
                        <td><input type="text" name="ram" /></td>
                    </tr>
                    <tr>
                        <td>Weight</td>
                        <td><input type="text" name="weight" /></td>
                    </tr>
                    <tr>
                        <td>Dimensions</td>
                        <td><input type="text" name="dimensions" /></td>
                    </tr>
                    <tr>
                        <td>Model Number</td>
                        <td><input type="text" name="model_number" /></td>
                    </tr>
                    <tr>
                        <td>Connection Tech.</td>
                        <td><textarea rows="2" cols="30" name="con_tech" style="height: 87px; width: 70%;"></textarea></td>
                    </tr>
                    <tr>
                        <td>Special Features</td>
                        <td><textarea rows="2" cols="30" name="special_features" style="height: 87px; width: 70%;"></textarea></td>
                    </tr>
                    <tr>
                        <td>Camera</td>
                        <td><input type="text" name="camera" /></td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td><input type="text" name="weight" /></td>
                    </tr>
                    <tr>
                        <td>battery_power</td>
                        <td><input type="text" name="color" /></td>
                    </tr>
                    <tr>
                        <td>In The Box</td>
                        <td><textarea rows="2" cols="30" name="in_the_box" style="height: 87px; width: 70%;"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" style="width: 20%;" /></td>
                    </tr>
                    <%
                        if (msg != null) {
                    %>
                    <tr>
                        <td colspan="2" style="color: red;">Either product details are missing or product details extends database length.</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div>
        <%
            }
            if (cat_id.equals("Pro_201")) {
        %>
        <div>
            <form action="../AddProductDetailLaptop" method="post">
                <table>
                    <tr>
                        <td>Product ID</td>
                        <td><%= pro_id%></td>
                    </tr>
                    <tr>
                        <td>Brand</td>
                        <td><input type="text" name="brand" /></td>
                    </tr>
                    <tr>
                        <td>Model Number</td>
                        <td><input type="text" name="model_num" /></td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td><input type="text" name="color" /></td>
                    </tr>
                    <tr>
                        <td>Height</td>
                        <td><input type="text" name="height" /></td>
                    </tr>
                    <tr>
                        <td>Width</td>
                        <td><input type="text" name="width" /></td>
                    </tr>
                    <tr>
                        <td>Screen Size</td>
                        <td><input type="text" name="scr_size" /></td>
                    </tr>
                    <tr>
                        <td>Display Resolution</td>
                        <td><input type="text" name="dis_res" /></td>
                    </tr>
                    <tr>
                        <td>Weight</td>
                        <td><input type="text" name="weight" /></td>
                    </tr>
                    <tr>
                        <td>Product Dimensions</td>
                        <td><input type="text" name="pro_dim" /></td>
                    </tr>
                    <tr>
                        <td>Processor Brand</td>
                        <td><input type="text" name="pros_brand" /></td>
                    </tr>
                    <tr>
                        <td>Processor Type</td>
                        <td><input type="text" name="pros_typ" /></td>
                    </tr>
                    <tr>
                        <td>Processor Speed</td>
                        <td><input type="text" name="pros_spd" /></td>
                    </tr>
                    <tr>
                        <td>Processor Count</td>
                        <td><input type="text" name="pros_count" /></td>
                    </tr>
                    <tr>
                        <td>RAM</td>
                        <td><input type="text" name="ram" /></td>
                    </tr>
                    <tr>
                        <td>Memory Technology</td>
                        <td><input type="text" name="mem_typ" /></td>
                    </tr>
                    <tr>
                        <td>Computer Memory Type</td>
                        <td><input type="text" name="com_mem_typ" /></td>
                    </tr>
                    <tr>
                        <td>HDD</td>
                        <td><input type="text" name="hdd" /></td>
                    </tr>
                    <tr>
                        <td>Audio Details</td>
                        <td><input type="text" name="aud_dtl" /></td>
                    </tr>
                    <tr>
                        <td>Speaker Description</td>
                        <td><input type="text" name="spk_dis" /></td>
                    </tr>
                    <tr>
                        <td>Graphics Coprocessor</td>
                        <td><input type="text" name="grph_cop" /></td>
                    </tr>
                    <tr>
                        <td>Connectivity Type</td>
                        <td><input type="text" name="conn_typ" /></td>
                    </tr>
                    <tr>
                        <td>Hardware Platform</td>
                        <td><input type="text" name="hdwr_plt" /></td>
                    </tr>
                    <tr>
                        <td>OS</td>
                        <td><input type="text" name="os" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" style="width: 20%;" /></td>
                    </tr>
                    <%
                        if (msg != null) {
                    %>
                    <tr>
                        <td colspan="2" style="color: red;">Either product details are missing or product details extends database length.</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div>
        <%
            }
            if (cat_id.equals("Pro_301")) {
        %>
        <div>
            <form action="../AddProductDetailTv" method="post">
                <table>
                    <tr>
                        <td>product_id</td>
                        <td><%= pro_id%></td>
                    </tr>
                    <tr>
                        <td>Brand</td>
                        <td><input type="text" name="brand" /></td>
                    </tr>
                    <tr>
                        <td>Model</td>
                        <td><input type="text" name="model" /></td>
                    </tr>
                    <tr>
                        <td>Weight</td>
                        <td><input type="text" name="weight" /></td>
                    </tr>
                    <tr>
                        <td>Product Dimensions</td>
                        <td><input type="text" name="pro_dim" /></td>
                    </tr>
                    <tr>
                        <td>Resolution</td>
                        <td><input type="text" name="resolution" /></td>
                    </tr>
                    <tr>
                        <td>Display Technology</td>
                        <td><input type="text" name="dis_tech" /></td>
                    </tr>
                    <tr>
                        <td>Screen Size</td>
                        <td><input type="text" name="scr_size" /></td>
                    </tr>
                    <tr>
                        <td>Display Resolution Maximum</td>
                        <td><input type="text" name="max_dis_res" /></td>
                    </tr>
                    <tr>
                        <td>Audio Wattage</td>
                        <td><input type="text" name="audio_watt" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" style="width: 20%;" /></td>
                    </tr>
                    <%
                        if (msg != null) {
                    %>
                    <tr>
                        <td colspan="2" style="color: red;">Either product details are missing or product details extends database length.</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div><br>
        <%
            }
        %>
    <center><input type="button" value="Cancel" onclick="location.href = 'admin_option.jsp'" style="width: 20%;"/></center>
</body>
<%
    } else {
        response.sendRedirect("admin_login.jsp");
    }
%>
</html>
