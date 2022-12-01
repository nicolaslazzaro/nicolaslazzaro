package Formularios;

import Usuarios.Persona;
import Usuarios.Rescatista;
import Usuarios.atributos.TipoDocumento;
import Utils.Posicion;

import java.time.LocalDate;
import java.util.ArrayList;

public class PublicacionTest {
  Direccion unaDireccion = new Direccion("CABA", "CalleFalsa", 1267, 1,"B");

  Persona personaMario = new Persona("Mario", "Martinez", LocalDate.of(1997, 6,2),
      TipoDocumento.DNI, 37988120,new ArrayList<>());

  Rescatista rescatistaMario = new Rescatista(personaMario, unaDireccion);
  Posicion posicionPitunia = new Posicion(432, 213);

  //MascotaEncontradaSinChapita unFormulario = new MascotaEncontradaSinChapita(LocalDate.now().minusDays(2),
  //    rescatistaMario ,[],"Buen Estado", posicionPitunia);
}
