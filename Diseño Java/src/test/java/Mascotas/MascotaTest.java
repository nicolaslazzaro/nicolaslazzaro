package Mascotas;

import Mascotas.Repos.RepoCaracteristicas;
import Usuarios.Duenio;
import Usuarios.Persona;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.atributos.TipoDocumento;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class MascotaTest {
  private static Animal perro;
  private static Animal gata;
  private static Mascota perroThor;
  private static Mascota gataPitunia;
  private static Caracteristica castradaNo;
  private static Caracteristica colorNegro;
  private static Duenio duenioJuan;
  private static Persona personaJuan;

  @BeforeAll
  static void inicializarTest() {
    perro = new Animal(Especie.PERRO, Sexo.MACHO, new ArrayList<>());
    gata = new Animal(Especie.GATO ,Sexo.HEMBRA ,new ArrayList<>());
    perroThor = new Mascota(perro, "Thor", "Thor", 4, new ArrayList<>(), "efgh");
    gataPitunia = new Mascota(gata, "Pitunia", "Pitunia", 4, new ArrayList<>(), "asdf");
    RepoCaracteristicas.getInstance().getCaracteristicas().add(colorNegro);
    RepoCaracteristicas.getInstance().getCaracteristicas().add(castradaNo);
    colorNegro = new Caracteristica("Color","Negro");
    castradaNo = new Caracteristica("Castrada","No");

    personaJuan = new Persona("Juan",
        "Martinez", LocalDate.of(1992, 5, 23),
        TipoDocumento.DNI, 27177089,
        new ArrayList<>());

    duenioJuan = new Duenio("AmanteDeAnimales", new Contrasenia("contraseñaValida!"), personaJuan);
  }


  @Test
  public void laEspecieDePituniaEsGato(){
    assertEquals(gataPitunia.getAnimal().getEspecie(), Especie.GATO);
  }

  @Test
  public void laEspecieDeThorEsPerro(){
    assertEquals(perroThor.getAnimal().getEspecie(), Especie.PERRO);
  }

  @Test
  public void elSexoDePituniaEsHembra(){
    assertEquals(gataPitunia.getAnimal().getSexo(), Sexo.HEMBRA);
  }

  @Test
  public void elSexoDeThorEsMacho(){
    assertEquals(perroThor.getAnimal().getSexo(), Sexo.MACHO);
  }

  @Test
  public void pituniaTieneDosCaracteristicas(){
    gataPitunia.getAnimal().getCaracteristicas().clear();
    gataPitunia.getAnimal().getCaracteristicas().add(colorNegro);
    gataPitunia.getAnimal().getCaracteristicas().add(castradaNo);
    assertEquals(gataPitunia.getAnimal().getCaracteristicas().size(), 2);
  }

  @Test
  public void pituniaTieneLaCaracteristicaNegroPrincial(){
    gataPitunia.getAnimal().getCaracteristicas().add(colorNegro);
    assertTrue(gataPitunia.getAnimal().getCaracteristicas().contains(colorNegro));
  }

  @Test
  public void mascotaBuscaASuDuenio(){
    duenioJuan.registrarMascota(gataPitunia);
    assertEquals(duenioJuan,gataPitunia.getDuenio());
  }


}
