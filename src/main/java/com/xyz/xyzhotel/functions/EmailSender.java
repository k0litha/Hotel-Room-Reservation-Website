package com.xyz.xyzhotel.functions;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.net.ssl.SSLSocketFactory;


    public class EmailSender
    {
        public void send(String to, String sub,String msg)
        {

            String user= "amandagolinger01@gmail.com";
            String pass="kolitha123";
            Properties props = new Properties();


            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
            //props.setProperty("mail.smtp.ssl.trust","*"); by adding this it solves all the server side certificates errors
            // solution I have found>> https://stackoverflow.com/questions/29009746/glassfish-java-email-and-certificate
            props.setProperty("mail.smtp.ssl.trust","*");





            Session session = Session.getInstance(props,new Authenticator()
            {
                @Override
                protected PasswordAuthentication getPasswordAuthentication()
                {
                    return new PasswordAuthentication(user,pass);
                }
            });

            try {


                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(user));
                message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
                message.setSubject(sub);
                message.setText(msg);

                /* Transport class is used to deliver the message to the recipients */

                Transport.send(message);
            }
            catch(Exception e) {
                e.printStackTrace();
            }
        }
    }

