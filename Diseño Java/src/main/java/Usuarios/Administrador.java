package Usuarios;

import Formularios.Preguntas.PreguntaAdopcion;
import Formularios.Repos.RepoPreguntas;
import Mascotas.Caracteristica;
import Mascotas.Repos.RepoCaracteristicas;
import Usuarios.Seguridad.Contrasenia;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value="Administrador")
public class Administrador extends Usuario {

  public Administrador(String nombreUsuario, Contrasenia contrasenia) {
    super(nombreUsuario, contrasenia);
  }


//  Ahora el admin crea definiciones de caracteristicas para que Mascota pueda intanciarse
  public void agregarDefinicionCaracteristica(Caracteristica caracteristica) {
    RepoCaracteristicas.getInstance().agregarCaracteristica(caracteristica);
  }
  public void agregarPregunta(PreguntaAdopcion pregunta) {
    RepoPreguntas.getInstance().agregarPregunta(pregunta);
  }
}
