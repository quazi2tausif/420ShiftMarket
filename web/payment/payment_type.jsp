<%-- 
    Document   : payment_type
    Created on : Jun 3, 2017, 9:24:50 PM
    Author     : 420ShiftMarket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dummy Payment</title>
        <%
            String ack = (String) request.getSession().getAttribute("ack");
            String client_id = (String) request.getSession().getAttribute("client_id");
            if (client_id != null) {
                String pro_id = (String) request.getSession().getAttribute("pro_id");
                String pro_name = (String) request.getSession().getAttribute("pro_name");
                String quan = (String) request.getSession().getAttribute("quan");
                String t_amt = (String) request.getSession().getAttribute("t_amt");
                String atc = (String) request.getSession().getAttribute("atc");
        %>
        <style>
            div{
                font-family: cambria;
                border-radius: 10px;
            }
            .titel{
                text-align: center;
                font-size: 30px;
                color: white;
                background-color: #333333;
                padding: 20px;
            }
            .step{
                padding: 10px;
                background-color: orange;
                font-size: 18px;
            }
            .step:hover{
                background-color: darkorange;
            }
            .tdim{
                width: 100%;
                padding: 10px;
                text-align: center;
                font-size: 18px;
            }
            input{
                width: 100%;
                font-size: 18px;
            }
            td{
                padding: 10px;
            } 
            a{
                text-decoration: none;
            }
            .tdim td:hover{
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            .tdim2{
                width: 100%;
                padding: 10px;
                text-align: right;
                font-size: 18px;
            }
        </style>
        <script src="../js/jquery-3.2.0.js"></script>
        <script>
            $(document).ready(function() {
                $("#f1").click(function() {
                    $("#pp2").slideDown("slow");
                    $("#pp1").slideUp("slow");
                    $("#t1 b").append(" Internet Banking");
                });
                $("#f2").click(function() {
                    $("#p2").slideDown("slow");
                    $("#p1").slideUp("slow");
                    $("#t1 b").append(" Card Banking");
                });
                $("#f3").click(function() {
                    $("#t2 b").append(" COD");
                });
                $("#f4").click(function() {
                    $("#t2 b").append(" State Bank of India");
                    $("#p3").slideDown("slow");
                    $("#p2").slideUp("slow");
                });
                $("#f5").click(function() {
                    $("#t2 b").append(" Axis Bank");
                    $("#p3").slideDown("slow");
                    $("#p2").slideUp("slow");
                });
                $("#f6").click(function() {
                    $("#t2 b").append(" ICICI Bank");
                    $("#p3").slideDown("slow");
                    $("#p2").slideUp("slow");
                });
                $("#f7").click(function() {
                    $("#t2 b").append(" Punjab National Bank");
                    $("#p3").slideDown("slow");
                    $("#p2").slideUp("slow");
                });
                $("#f8").click(function() {
                    $("#t3 b").append(" Credit Card");
                    $("#p4").slideDown("slow");
                    $("#p3").slideUp("slow");
                });
                $("#f9").click(function() {
                    $("#t3 b").append(" Debit Card");
                    $("#p4").slideDown("slow");
                    $("#p3").slideUp("slow");
                });
            });
        </script>
    </head>
    <body>
        <div class="titel">
            <b>Dummy Payment</b>
        </div><br>
        <div class="step" id="t1">
            <b>Step 1. Select Payment Type : </b><img src="img/down.png" style="float: right;"/>
        </div>
        <div id="pp1">
            <div id="p1">
                <table class="tdim">
                    <tr>
                        <td id="f1"><img src="img/type/internet_bank.png"/><br>Internet Banking</td>
                        <td id="f2"><img src="img/type/card.png"/><br>Card Banking</td>
                        <td id="f3">
                            <img src="img/type/cod.png" onclick="location.href = '../PaymentThroughCOD'"/>
                            <br>COD
                        </td>
                    </tr>
                </table>
            </div>
            <div class="step" id="t2">
                <b>Step 2. Select Bank : </b><img src="img/down.png" style="float: right;"/>
            </div>
            <div hidden="true" id="p2">
                <table class="tdim">
                    <tr>
                        <td id="f4"><img src="img/bank/sbi.jpg" style="width: 64px; height: 64px;"/><br>State Bank of India</td>
                        <td id="f5"><img src="img/bank/axis.jpg" style="width: 254px; height: 64px;"/><br>Axis Bank</td>
                        <td id="f6"><img src="img/bank/icici.jpg" style="width: 254px; height: 64px;"/><br>ICICI Bank</td>
                        <td id="f7"><img src="img/bank/pnb.jpg" style="width: 254px; height: 64px;"/><br>Punjab National Bank</td>
                    </tr>
                </table>
            </div>
            <div class="step" id="t3">
                <b>Step 3. Select Card Type : </b><img src="img/down.png" style="float: right;"/>
            </div>
            <div hidden="true" id="p3">
                <table class="tdim">
                    <tr>
                        <td id="f8"><img src="img/card/credit.png" style="width: 128px; height: 80px;"/><br>Credit Card</td>
                        <td id="f9"><img src="img/card/debit.png" style="width: 128px; height: 80px;"/><br>Debit Card</td>
                    </tr>
                </table>
            </div>
            <div class="step">
                <b>Step 4. Card Holder Detail : </b><img src="img/down.png" style="float: right;"/>
            </div>
            <div hidden="true" id="p4">
                <div style="float: left; width: 50%;">
                    <table class="tdim2">
                        <tr>
                            <td>Card Number :</td>
                            <td><input type="text" name="card_name"/></td>
                        </tr>
                        <tr>
                            <td>Expire Date :</td>
                            <td><input type="date" name="card_ex_date"/></td>
                        </tr>
                        <tr>
                            <td>CVV No. :</td>
                            <td><input type="text" name="card_cvv"/></td>
                        </tr>
                        <tr>
                            <td>Card Holder Name :</td>
                            <td><input type="text" name="holder_name"/></td>
                        </tr>
                        <tr>
                            <td>Amount :</td>
                            <td><%= t_amt%></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="../PaymentDoneCard">
                                    <input type="button" value="Submit" style="width: 30%; height: 40px;"/>
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right;">
                    <img src="img/cvv.png"/>
                </div>
            </div>
        </div>
        <div id="pp2" hidden="true">
            <div class="step">
                <b>Step 2. Select Bank : </b><img src="img/down.png" style="float: right;"/>
            </div>
            <div>
                <table class="tdim">
                    <tr>
                        <td><img src="img/bank/sbi.jpg" style="width: 64px; height: 64px;" onclick="location.href = 'https://www.sbi.co.in/'"/><br>State Bank of India</td>
                        <td><img src="img/bank/axis.jpg" style="width: 254px; height: 64px;" onclick="location.href = 'https://www.axisbank.com/'"/><br>Axis Bank</td>
                        <td><img src="img/bank/icici.jpg" style="width: 254px; height: 64px;" onclick="location.href = 'https://www.icicibank.com/'"/><br>ICICI Bank</td>
                        <td><img src="img/bank/pnb.jpg" style="width: 254px; height: 64px;" onclick="location.href = 'https://www.pnbindia.in/'"/><br>Punjab National Bank</td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
    <%
        } else {
            response.sendRedirect("../420market.jsp");
        }
    %>
</html>
