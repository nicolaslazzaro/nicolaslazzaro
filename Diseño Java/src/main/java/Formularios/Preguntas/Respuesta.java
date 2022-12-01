package Formularios.Preguntas;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity(name = "respuesta")
public class Respuesta {

  @Id
  @GeneratedValue
  private Long idRespuesta;

  public String respuesta;

  @OneToOne
  public PreguntaAdopcion Pregunta;

  public Respuesta(String respuesta, PreguntaAdopcion pregunta) {
    this.respuesta = respuesta;
    this.Pregunta = pregunta;
  }
}
