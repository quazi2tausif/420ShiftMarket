package com.mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ClientMail {

    public static void main(String[] args) {
        try {
            Properties properties = System.getProperties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com");
            Session mailSession = Session.getDefaultInstance(properties);
            try {
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress("tausif3xman@gmail.com"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress("example@gmail.com"));
                message.setSubject("This is the Subject Line!");
                message.setText("This is actual message");
                Transport.send(message);
                String result = "Sent message successfully....";
                System.out.println(result);
            } catch (MessagingException mex) {
                mex.printStackTrace();
                String result = "Error: unable to send message....";
                System.out.println(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
