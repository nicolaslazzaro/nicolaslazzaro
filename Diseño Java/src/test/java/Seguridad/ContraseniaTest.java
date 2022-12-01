package Seguridad;

import Usuarios.Seguridad.Contrasenia;
import Usuarios.Seguridad.Validadores.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class ContraseniaTest {
  private static Contrasenia contrasenia;

  @BeforeAll
  static void inicializarTest() {
    contrasenia = new Contrasenia("Válido!");
  }

  @Test
  public void contraseniasConElMismoTextoSonIguales() {
    assertEquals(contrasenia.getContrasenia(),"Válido!");
  }

  @Test
  public void contraseniasQueSonDistintasNoSonIguales() {
    assertNotEquals(contrasenia.getContrasenia(),"InVálido!");
  }

  @Test
  public void contraseniasCumplenValidadores() {
    assertDoesNotThrow( () -> (new ValidadorContrasenia_CaracterEspecial()).validarContrasenia("TengoCaracterEspecial!"));
    assertDoesNotThrow( () -> (new ValidadorContrasenia_IgualAlUsuario("NombreDeUsuario")).validarContrasenia("Contraseña"));
    assertDoesNotThrow( () -> (new ValidadorContrasenia_Logitud(5)).validarContrasenia("MasDe5"));
    assertDoesNotThrow( () -> (new ValidadorContrasenia_TopPeores()).validarContrasenia("5uP3rC0n7r4séña"));
  }

  @Test
  public void contraseniasNoCumplenValidadores() {
    assertThrows(InvalidPasswordException.class, () -> (new ValidadorContrasenia_CaracterEspecial()).validarContrasenia("NoTengoCaracterEspecial"));
    assertThrows(InvalidPasswordException.class, () -> (new ValidadorContrasenia_IgualAlUsuario("NombreDeUsuario")).validarContrasenia("NombreDeUsuario"));
    assertThrows(InvalidPasswordException.class, () -> (new ValidadorContrasenia_Logitud(6)).validarContrasenia("Cinco"));
    assertThrows(InvalidPasswordException.class, () -> (new ValidadorContrasenia_TopPeores()).validarContrasenia("123456"));
  }
}
