<%-- 
    Document   : acknowledgement
    Created on : May 30, 2017, 5:30:31 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acknowledgement</title>
        <style>
            table td{
                padding: 10px;
            }
            .tl{
                padding: 10px;
                text-align: center;
                background-color: darkorange;
                color: white;
                font-family: cambria;
            }
            td input{
                width: 70%;
                height: 50px;
                font-family: cambria;
                font-size: 18px;
            }
            table{
                font-family: cambria;
                font-size: 20px;
            }
            .bt1{
                border-radius: 5px;
                background-color: orange;
                color: white;
            }
            .bt1:hover{
                background-color: sandybrown;
            }
        </style>
    </head>
    <body>
    <center>
        <div class="tl">
            <h1>Acknowledgement</h1>
        </div>
        <div>
            <form action="Acknowledgement" method="post">
                <table>
                    <tr>
                        <td colspan="2">This web-site is for study purpose. <b>Please</b> do not encourage people to do some stupid action<br>
                            like shearing their Credit Card details or permanent address. This kind of action lead user to the <br>
                            bigger consequences.</td>
                    </tr>
                    <tr>
                        <td style="text-align: left;">
                            <input type="submit" value="Continue" class="bt1"/>
                        </td>
                        <td style="text-align: right;">
                            <input type="button" value="Exit" onclick="location.href = 'http://www.bing.com/'" class="bt1"/>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="ack" value="agree" />
            </form>
        </div>
    </center>
</body>
</html>

