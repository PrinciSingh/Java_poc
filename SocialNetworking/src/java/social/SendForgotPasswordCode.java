/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package social;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author A1
 */
public class SendForgotPasswordCode {
    String status="";
    String email="";
    String code="";
    public void setEmail(String emailid)
    {
        email=emailid;
    }
    public void setCode(String newcode)
    {
        code=newcode;
    }
    public String sendEmail()
    {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Authenticator auth = new SMTPAuthenticator();

        Session session = Session.getDefaultInstance(props, auth);

        try
        {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("friendforevercvrca@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
            message.setSubject("Verification Code");
            message.setContent("<center><p style='color:#0000FF'>Verification Code For Change Password.<br/><br/><b>Enter This Code To Verify: "+code+"</b></p></center>","text/html");
            Transport.send(message);
            status="Success";
        }
        catch(Exception e)
        {
            System.out.println(e);
            status="Fail";
        }

        return status;
    }
}


