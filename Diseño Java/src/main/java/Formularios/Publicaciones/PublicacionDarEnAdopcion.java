package Formularios.Publicaciones;

import Formularios.Asociacion;
import Formularios.Preguntas.PreguntaAdopcion;
import Formularios.Preguntas.Respuesta;
import Mascotas.Mascota;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity(name = "publicacion_dar_en_adopcion")
public class PublicacionDarEnAdopcion {

  @Id
  @GeneratedValue
  private Long idPublicacionEnAdopcion;

  public LocalDate fecha;

  @ManyToOne
  private Asociacion asociacion;

  @ManyToOne
  private Mascota mascota;

  @ManyToMany
  private List<PreguntaAdopcion> preguntasAdopcion;

  @OneToMany
  @JoinColumn(name = "idPublicacionEnAdopcion")
  private List<Respuesta> respuestasAdopcion;

  public PublicacionDarEnAdopcion(Asociacion asociacion, Mascota mascota,
                                  List<Respuesta> respuestasAdopcion) {
    this.fecha = LocalDate.now();
    this.asociacion = asociacion;
    this.mascota = mascota;
    this.preguntasAdopcion = asociacion.getPreguntas();
    this.respuestasAdopcion = respuestasAdopcion;
  }

  public void notificarQueAlguienQuiereAdoptar(){
    mascota.getDuenio().notificar("Alguien quiere adoptar una mascota!");
  }

  public LocalDate getFecha() {
    return fecha;
  }

  public Asociacion getAsociacion() {
    return asociacion;
  }

  public Mascota getMascota() {
    return mascota;
  }

  public List<PreguntaAdopcion> getPreguntasAdopcion() {
    return preguntasAdopcion;
  }

  public List<Respuesta> getRespuestasAdopcion() {
    return respuestasAdopcion;
  }
}
