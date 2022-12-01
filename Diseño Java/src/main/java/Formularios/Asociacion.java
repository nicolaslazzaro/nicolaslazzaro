package Formularios;

import Formularios.Preguntas.PreguntaAdopcion;
import Formularios.Repos.RepoPreguntas;
import Formularios.Preguntas.Respuesta;
import Formularios.Publicaciones.PublicacionDarEnAdopcion;
import Mascotas.Mascota;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.Voluntario;
import Utils.Posicion;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "asociacion")
public class Asociacion {

  @Id
  @GeneratedValue
  private Long idAsociacion;

  private String nombre;

  @ManyToMany
  private List<Voluntario> voluntarios;

  @Embedded
  private Direccion direccion;

  @Embedded
  private Posicion posicion;

  @OneToMany
  private List<PreguntaAdopcion> preguntasAdopcion;

  public Asociacion(String nombre, List<Voluntario> voluntarios, Direccion direccion, Posicion posicion) {
    this.nombre = nombre;
    this.voluntarios = voluntarios;
    this.direccion = direccion;
    this.posicion = posicion;
    this.preguntasAdopcion = new ArrayList<>();
  }

  private  void agregarVoluntario(String nombreUsuario, Contrasenia contrasenia){
    this.voluntarios.add(new Voluntario(nombreUsuario, contrasenia));
  }

  public List<PreguntaAdopcion> mostrarPreguntas() {
    return this.preguntasAdopcion;
  }

  public void agregarPreguntaAdopcion(PreguntaAdopcion pregunta) {
    if (RepoPreguntas.getInstance().existePregunta(pregunta)){
      this.preguntasAdopcion.add(pregunta);
    }else {
      throw new RuntimeException("No existe la pregunta");
    }
  }

  public void quitarPreguntaAdopcion(PreguntaAdopcion pregunta){
    this.preguntasAdopcion.remove(pregunta);
  }

  public String getNombre() {
    return nombre;
  }

  public List<Voluntario> getVoluntarios() {
    return voluntarios;
  }

  public Direccion getDireccion() {
    return direccion;
  }

  public Posicion getPosicion() {
    return posicion;
  }

  public List<PreguntaAdopcion> getPreguntas() {return preguntasAdopcion; }

  public PublicacionDarEnAdopcion generarPublicacionAdopcion(Mascota mascota, List<Respuesta> respuestas) {
    return new PublicacionDarEnAdopcion(this,mascota, respuestas);
    //TODO: La publicacion recibe las preguntas y respuestas pero tiene que hacer algo con eso?
  }
}
