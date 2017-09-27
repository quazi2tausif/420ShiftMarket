<%-- 
    Document   : admin_login
    Created on : Jun 1, 2017, 7:29:14 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>420Market Admin Login</title>
        <style>
            table,th,td{
                border: 1px solid black;
            }
            table{
                border-spacing: 5px;
            }            
            th,td{
                padding: 10px;
                text-align: center;
            }
        </style>
        <script src="../js/jquery-3.2.0.js"></script>
        <script>
            $(document).ready(function() {
                $("#fa").delay(10000).fadeOut(1);
            });
        </script>
    </head>
    <body>
        <div style="text-align: left; background-color: royalblue;"> 
            <img src="../img/420.png" alt="420" style="width:96px;height:96px;"/>
            <img src="../img/Market.png" alt="Market" style="width:288px;height:96px;"/>
            <img src="../img/admin.png" alt="admin" style="height:96px;width:96px;"/>
        </div>
        <hr style="height: 20px; background-color: #333333;">
        <form action="../AdminLogin" method="post">
            <br>
            <br>
            <center>
                <table>
                    <tr>
                        <td>Admin ID : </td>
                        <td><input type="text" name="adminid"/></td>
                    </tr>
                    <tr>
                        <td>Admin Password : </td>
                        <td><input type="password" name="adminpassword"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
                <%
                    String msg = request.getParameter("msg");
                    if (msg != null) {
                %>
                <div style="color: red;" id="fa">Admin ID or Admin Password is wrong.</div>
                <%
                    }
                %>
            </center>
        </form>
    </body>
</html>