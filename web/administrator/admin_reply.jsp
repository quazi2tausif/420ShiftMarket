<%-- 
    Document   : admin_reply
    Created on : Jun 6, 2017, 6:38:14 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Reply</title>
        <%
            String s = (String) request.getSession().getAttribute("admin_id");
            if (s != null) {
                String failmsg = request.getParameter("msg");
                String ci = request.getParameter("ci");
                request.getSession().setAttribute("ci", ci);
                String cq = request.getParameter("cq");
                request.getSession().setAttribute("cq", cq);
                String cd = request.getParameter("cd");
                request.getSession().setAttribute("cd", cd);
                String ct = request.getParameter("ct");
                request.getSession().setAttribute("ct", ct);
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
                padding: 10px;
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
        <script>
            $(document).ready(function() {
                $("#fc").delay(10000).fadeOut(1);
            });
        </script>
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
        <form action="../AdminReply" method="post">
            <table style="width: 50%;">
                <tr>
                    <td>To Email ID</td>
                    <td><%= ci %></td>
                </tr>
                <tr>
                    <td rowspan="2">Reply</td>
                    <td style="font-size: 15px;">Word limited to 140 characters.</td>
                </tr>
                <tr>
                    <td><textarea rows="2" cols="30" name="reply" style="height: 87px; width: 100%;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit" /><input type="button" value="Reset" onclick="this.form.elements['enquiry'].value = ''"></td>
                </tr>
                <%
                    if (failmsg != null) {
                %>
                <div style="color: red; text-align: center;" class="fc">Enquiry Failed.Please Try Again.</div>
                <%
                    }
                %>
            </table>
        </form>
    </div>
    </body>
    <%
        } else {
            response.sendRedirect("admin_login.jsp");
        }
    %>
</html>
