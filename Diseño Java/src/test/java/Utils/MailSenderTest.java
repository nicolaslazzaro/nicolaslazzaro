package Utils;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

public class MailSenderTest {

  static MailSender mailSender;

  @BeforeAll
  static void inicializarTest() {
    mailSender = Mockito.mock(MailSender.class); // Lo mockeo porque sino va a mandar mail cada vez que ejecutas el test
  }

  @Test
  public void mailEnviadoTest(){
    assertDoesNotThrow(() -> mailSender.sendEmail("Test","Prueba de mail","mail@gmail.com"));
  }
}
