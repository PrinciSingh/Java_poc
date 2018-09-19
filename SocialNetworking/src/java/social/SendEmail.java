/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package social;
import java.util.Properties;     
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author A1
 */
public class SendEmail {
    String status="";
    String email="";
    String code="";
    public void setEmail(String nemail)
    {
        email=nemail;
    }
    public void setCode(String ncode) 
    {
        code=ncode;
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
            message.setFrom(new InternetAddress("princimcasingh@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
            message.setSubject("Verification Code");
            message.setContent("<p style='{color:#0033CC}'>Verification Code For Completing The Signup Process On Friends Forever.<br/><br/><b>Enter This Code To Verify: "+code+"</b></p>","text/html");
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
class SMTPAuthenticator extends javax.mail.Authenticator
{
    public PasswordAuthentication getPasswordAuthentication()
    {
        return new PasswordAuthentication("princimcasingh@gmail.com","meera1234");
    }
}
