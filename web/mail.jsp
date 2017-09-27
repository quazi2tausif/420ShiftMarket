<%-- 
    Document   : mail
    Created on : Jun 8, 2017, 7:07:01 PM
    Author     : admin
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   String result;
   String to = "tausif3xman@gmail.com";
   String from = "tausif3xman@gmail.com";
   String host = "localhost";
   Properties properties = System.getProperties();
   properties.setProperty("mail.smtp.host", "smtp.gmail.com");
   Session mailSession = Session.getDefaultInstance(properties);

   try {
      MimeMessage message = new MimeMessage(mailSession);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
      message.setSubject("This is the Subject Line!");
      message.setText("This is actual message");
      Transport.send(message);
      result = "Sent message successfully....";
   } catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
      out.println(mex);
   }
%>

<html>
   <head>
      <title>Send Email using JSP</title>
   </head>
   
   <body>
      <center>
         <h1>Send Email using JSP</h1>
      </center>
      
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
      </p>
   </body>
</html>
