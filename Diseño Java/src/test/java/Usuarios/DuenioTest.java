package Usuarios;

import Mascotas.Animal;
import Mascotas.Especie;
import Mascotas.Mascota;
import Mascotas.Sexo;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.atributos.Contacto;
import Usuarios.atributos.TipoDocumento;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class DuenioTest {

  @Test
  public void elDuenioJuanTieneComoContactoContactoJuan1() {
    duenioJuan.registrarContactos(contacotJuan2);
    assertTrue(duenioJuan.contactos().contains(contacotJuan2));
  }

  @Test
  public void elDuenioJuanTieneDosContactos() {
    duenioJuan.registrarContactos(contacotJuan1, contacotJuan2);
    assertEquals(duenioJuan.contactos().size(), 2);
  }

  @Test
  public void elTipoDeDocumentoDeJuanEsDNI(){
    assertEquals(duenioJuan.getPersona().getTipoDocumento().toString(), "DNI");
  }

  @Test
  public void juanPuedeRegistrarAPerroFidoComoSuMascota(){
    duenioJuan.registrarMascota(perroFido);
    assertEquals(duenioJuan,perroFido.getDuenio());
  }

  @Test
  public void juanTieneDosMascotas(){
    duenioJuan.registrarMascota(perroFido);
    duenioJuan.registrarMascota(perroThor);
    assertEquals(duenioJuan,perroFido.getDuenio());
    assertEquals(duenioJuan,perroThor.getDuenio());
  }

  Persona personaJuan = new Persona( "Juan",
      "Martinez", LocalDate.of(1992, 5, 23),
      TipoDocumento.DNI, 27177089,
      new ArrayList<>());

  Duenio duenioJuan = new Duenio("AmanteDeAnimales", new Contrasenia("contraseñaValida!"),
      personaJuan);

  Contacto contacotJuan1 = new Contacto ("Juan", "Martinez",
      1156710982, "juan123@gmail.com");

  Contacto contacotJuan2 = new Contacto ("Juan", "Martinez",
      1109814321, "juanM@gmail.com");

  Animal perro = new Animal(Especie.PERRO, Sexo.MACHO, new ArrayList<>());

  Mascota perroFido = new Mascota(perro, "Fido", "Fi", 4,
      new ArrayList<>(), "abcd");

  Mascota perroThor = new Mascota(perro, "Thor", "Thor", 4,
      new ArrayList<>(), "efgh");


}
