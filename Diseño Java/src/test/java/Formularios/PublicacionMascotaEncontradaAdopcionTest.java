package Formularios;

import Formularios.Publicaciones.PublicacionDarEnAdopcion;
import Mascotas.*;
import Mascotas.Repos.RepoCaracteristicas;
import Usuarios.Duenio;
import Usuarios.Persona;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.atributos.TipoDocumento;
import Utils.Posicion;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;

public class PublicacionMascotaEncontradaAdopcionTest {
  private static Persona unPersona;
  private static Duenio unDuenio;
  private static Direccion unaDireccion;
  private static Caracteristica unaCaracteristica;
  private static Animal gato;
  private static Mascota unaMascota;
  private static Asociacion unaAsociacion;
  private static Caracteristica colorNegro;
  private static PublicacionDarEnAdopcion unaPublicacionDarEnAdopcion;

  @BeforeAll
  static void inicializarTest() {
    unPersona = new Persona("El jorgito",
        "No tiene apellido", LocalDate.now(), TipoDocumento.DNI,40256458,new ArrayList<>());
    unDuenio = new Duenio("Jorge2",new Contrasenia("cqueir5862@1"),unPersona);
    unaDireccion = new Direccion("CABA","Calle Falsa",123,12,"A");
    gato = new Animal(Especie.GATO ,Sexo.HEMBRA ,new ArrayList<>());
    unaMascota = new Mascota(gato,"Mishi", "Gatito",5,
        new ArrayList<>(),"Codigo 1");
    unaAsociacion = new Asociacion("Una Asociacion",new ArrayList<>(),
        unaDireccion,new Posicion(1,2));
    RepoCaracteristicas.getInstance().getCaracteristicas().add(colorNegro);
    colorNegro = new Caracteristica("Color","Negro");
    unaPublicacionDarEnAdopcion = new PublicacionDarEnAdopcion(unaAsociacion,unaMascota,new ArrayList<>());
  }

  @Test
  public void unDuenioPuedeDarEnAdopcionASuMascota() {
    unaMascota.getAnimal().getCaracteristicas().clear();
    unaMascota.getAnimal().getCaracteristicas().add(colorNegro);
    Assertions.assertEquals(unaPublicacionDarEnAdopcion.getPreguntasAdopcion(),
        unDuenio.darEnAdopcion(unaMascota,unaAsociacion,new ArrayList<>()).getPreguntasAdopcion());
    Assertions.assertEquals(unaPublicacionDarEnAdopcion.getMascota(),
        unDuenio.darEnAdopcion(unaMascota,unaAsociacion,new ArrayList<>()).getMascota());
    Assertions.assertEquals(unaPublicacionDarEnAdopcion.getRespuestasAdopcion(),
        unDuenio.darEnAdopcion(unaMascota,unaAsociacion,new ArrayList<>()).getRespuestasAdopcion());
    Assertions.assertEquals(unaPublicacionDarEnAdopcion.getAsociacion(),
        unDuenio.darEnAdopcion(unaMascota,unaAsociacion,new ArrayList<>()).getAsociacion());
    Assertions.assertEquals(unaPublicacionDarEnAdopcion.getFecha(),
        unDuenio.darEnAdopcion(unaMascota,unaAsociacion,new ArrayList<>()).getFecha());

  }
}
