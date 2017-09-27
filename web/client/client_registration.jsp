<%-- 
    Document   : client_registration
    Created on : May 30, 2017, 6:30:59 PM
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
        %>
        <title>Registration</title>
        <style>
            body{
                background-color: royalblue;
            }
            table{
                float: left;
                width: 50%;
                border: 3px solid black;
                border-spacing: 5px;
                background-color: darkgoldenrod;
            }            
            th,td{
                font-family: cambria;
                font-size: 18px;
                padding: 10px;
                text-align: center;
            }
            tr:nth-child(odd)
            {
                background-color: white;
                color: black;
            }
            tr:nth-child(even)
            {
                background-color: gray;
                color: white;
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
                width: 70%;
                font-family: cambria;
                font-size: 18px;
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
        <li style="float: left;"><a href="../420market.jsp">Home</a></li>
        <li><a href="client_login.jsp">Login</a></li>
    </ul>
    <br>
    <br>
    <form action="../ClientRegistration">
        <table>
            <tr>
                <td>First Name : *</td>
                <td><input class="in" type="text" name="firstname"/></td>
            </tr>
            <tr>
                <td>Last Name : </td>
                <td><input class="in" type="text" name="lastname"/></td>
            </tr>
            <tr>
                <td>Enter UserID : *</td>
                <td><input class="in" type="text" name="userid"/></td>
            </tr>
            <tr>
                <td>Enter Password : *</td>
                <td><input class="in" type="password" name="pass1"/></td>
            </tr>
            <tr>
                <td>Confirm Password : *</td>
                <td><input class="in" type="password" name="pass2"/></td>
            </tr>
            <tr>
                <td>Phone Number : *</td>
                <td><input class="in" type="text" name="phone"/></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>DOB(DD/MM/YYYY) : </td>
                <td><input class="in" type="date" name="dob"/></td>
            </tr>
            <tr>
                <td>Gander : </td>
                <td><input type="radio" value="male" checked>Male
                    <input type="radio" value="female">Female
                    <input type="radio" value="other">Other</td>
            </tr>
            <tr>
                <td>Address : *</td>
                <td><textarea rows="2" cols="30" name="address" style="height: 87px; width: 70%;"></textarea></td>
            </tr>
            <tr>
                <td>State : </td>
                <td><input list="state" name="state">
                    <datalist id="state">
                        <option value="Delhi">
                        <option value="kerala">
                        <option value="Madhya Pradesh">
                        <option value="Tamil Nadu">
                        <option value="Uttar Pradesh">
                    </datalist>
                </td>
            </tr>
            <tr>
                <td>Browser : </td>
                <td><input type="checkbox" value="Chrome">Chrome
                    <input type="checkbox" value="Edge">Edge
                    <input type="checkbox" value="Safari">Safari
                    <input type="checkbox" value="uc web">UC Web
                </td>
            </tr>
        </table>
        <center><input style="font-family: cambria;font-size: 18px;" type="submit" value="Submit"/></center>
    </form>
    <div style="color: white;">
        <b>Note:</b> * --> Mandatory.
    </div>
</body>
<%
    } else {
        response.sendRedirect("../acknowledgement.jsp");
    }
%>
</html>

