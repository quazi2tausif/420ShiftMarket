<%-- 
    Document   : client_login
    Created on : May 30, 2017, 6:30:30 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            if (ack != null) {
                String msg = request.getParameter("msg");
                String client_path = request.getParameter("client_path");
                request.getSession().setAttribute("client_path", client_path);
                String pro_id = request.getParameter("pro_id");
                request.getSession().setAttribute("pro_id", pro_id);
        %>
        <title>Login to 420Market</title>
        <style>
            body{
                background-color: royalblue;
            }
            table{
                border: 3px solid black;
                border-spacing: 5px;
                width: 50%;
                background-color: darkgoldenrod;
            }
            th,td{
                font-family: cambria;
                font-size: 18px;
                padding: 10px;
                text-align: center;
                background-color: white;
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
            }
            li{
                float: right;
            }
            li a:hover {
                background-color: #111111;
            }
            .in{
                width: 80%;
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
    </head>
    <body>
    <center>
        <a href="../420market.jsp">
            <img src="../img/420.png" alt="420" style="width:96px;height:96px;"/>
            <img src="../img/Market.png" alt="Market" style="width:288px;height:96px;"/>
        </a>
    </center>
    <ul>
        <li style="float: left;"><a href="../420market.jsp">Home</a></li>
        <li><a href="client_registration.jsp">Registration</a></li>
    </ul>
    <br>
    <form action="../ClientLogin">
        <center>
            <table>
                <tr>
                    <td>UserID : </td>
                    <td><input class="in" type="text" name="userid"/></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input class="in" type="password" name="userpassword"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input style="font-family: cambria;font-size: 18px;" type="submit" value="Submit"/></td>
                </tr>
                <%
                    if (msg != null) {
                %>
                <tr>
                    <td style="color: red;" id="fc" colspan="2">Login ID or Password is incorrect.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </center>
    </form>
</body>
<%
    } else {
        response.sendRedirect("../acknowledgement.jsp");
    }
%>
</html>

