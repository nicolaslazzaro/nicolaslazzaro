package Utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailSender {

  private final Properties properties = new Properties();

  private String password; //DdSGrupo8

  private Session session;

  private void init() {

    password = "DdSGrupo8";
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.port", 25);
    properties.put("mail.smtp.mail.sender", "ddstp8@gmail.com");
    properties.put("mail.smtp.user", "ddstp8");
    properties.put("mail.smtp.auth", "true");

    session = Session.getDefaultInstance(properties);
  }

  public void sendEmail(String tema,String texto, String email) {

    init();
    try {
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
      message.setSubject("Rescate de patitas: " + tema);
      message.setText(texto);
      Transport t = session.getTransport("smtp");
      t.connect((String) properties.get("mail.smtp.user"), password);
      t.sendMessage(message, message.getAllRecipients());
      t.close();
    } catch (MessagingException me) {
      me.printStackTrace();
      throw new RuntimeException("No se pudo enviar el email");
    }
  }
}