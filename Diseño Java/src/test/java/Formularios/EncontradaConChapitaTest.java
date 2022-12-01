package Formularios;

import Formularios.Repos.RepoFormularios;
import Mascotas.*;
import Usuarios.*;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.atributos.Contacto;
import Usuarios.atributos.TipoDocumento;
import Utils.Posicion;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;

public class EncontradaConChapitaTest {

  @Test
  public void rescatistaMarioTieneDosContactos(){
    rescatistaMario.contactos().add(contacotMario1);
    rescatistaMario.contactos().add(contacotMario2);
    assertEquals(rescatistaMario.contactos().size(), 2);
  }

  @Test
  public void rescatistaMarioTieneContacotMario1(){
    rescatistaMario.contactos().add(contacotMario1);
    assertTrue(rescatistaMario.contactos().contains(contacotMario1));
  }

  @Test
  public void unFormularioPoseeAGataPitunia(){
    assertSame(unFormulario.getMascota(), gataPitunia);
  }

  @Test
  public void sePuedeCargarUnFormularioAlRepoFormularios(){
    assertEquals(unRepoFormularios.getFormularios().size(), 0);
    unRepoFormularios.cargarFormularios(unFormulario);
    assertEquals(unRepoFormularios.getFormularios().size(), 1);
  }

  @Test
  public void sePuedenCargarVariosFormulariosAlRepoFormularios(){
    assertEquals(unRepoFormularios.getFormularios().size(), 0);
    unRepoFormularios.cargarFormularios(unFormulario, unFormulario2);
    assertEquals(unRepoFormularios.getFormularios().size(), 2);
  }
  
  @Test
  public void enLosUltimosDiezDiasSeEncontraronDosMascotas(){
    unRepoFormularios.cargarFormularios(unFormulario, unFormulario2, unFormulario3);
    assertEquals(unRepoFormularios.getFormularios().size(), 3);
    assertEquals(unRepoFormularios.formularioUltimosDiezDias().size(), 2);
    assertTrue(unRepoFormularios.formularioUltimosDiezDias().contains(unFormulario));
    assertTrue(unRepoFormularios.formularioUltimosDiezDias().contains(unFormulario2));
    assertFalse(unRepoFormularios.formularioUltimosDiezDias().contains(unFormulario3));
  }

  Persona personaJuan = new Persona( "Juan",
      "Martinez", LocalDate.of(1992, 5, 23),
      TipoDocumento.DNI, 27177089,
      new ArrayList<>());

  Duenio duenioJuan = new Duenio("AmanteDeAnimales", new Contrasenia("contraseñaValida!"),
      personaJuan);

  Animal gata = new Animal(Especie.GATO ,Sexo.HEMBRA ,new ArrayList<>());

  Mascota gataPitunia = new Mascota(gata, "Pitunia", "Pitunia", 4,
      new ArrayList<>(), "asdf");

  Direccion unaDireccion = new Direccion("CABA", "CalleFalsa", 1267, 1,"B");

  RepoFormularios unRepoFormularios = new RepoFormularios();

  Persona personaMario = new Persona("Mario", "Martinez", LocalDate.of(1997, 6,2),
      TipoDocumento.DNI, 37988120,new ArrayList<>());

  Rescatista rescatistaMario = new Rescatista(personaMario, unaDireccion);

  Posicion posicionPitunia = new Posicion(432, 213);

  MascotaEncontrada encontrada1 = new MascotaEncontrada(LocalDate.now().minusDays(2),
      rescatistaMario, Collections.singletonList(new Foto("*datos de una foto*")),
          gataPitunia.getAnimal(), posicionPitunia);

  MascotaEncontrada encontrada2 = new MascotaEncontrada(LocalDate.now().minusDays(8),
      rescatistaMario, Collections.singletonList(new Foto("*datos de una foto*")),
          gataPitunia.getAnimal(), posicionPitunia);

  MascotaEncontrada encontrada3 = new MascotaEncontrada(LocalDate.now().minusDays(11),
      rescatistaMario, Collections.singletonList(new Foto("*datos de una foto*")),
          gataPitunia.getAnimal(), posicionPitunia);

  EncontradaConChapita unFormulario = new EncontradaConChapita(encontrada1, gataPitunia);

  EncontradaConChapita unFormulario2 = new EncontradaConChapita(encontrada2, gataPitunia);

  EncontradaConChapita unFormulario3 = new EncontradaConChapita(encontrada3, gataPitunia);

  Contacto contacotMario1 = new Contacto ("Mario", "Martinez",
      1198764367, "marioM@gmail.com");

  Contacto contacotMario2 = new Contacto ("Mario", "Martinez",
      1123425781, "mario64@gmail.com");

  Contacto contacotJuan = new Contacto ("Juan", "Gonzalez",
          1156265896, "JuanG@gmail.com");
}
