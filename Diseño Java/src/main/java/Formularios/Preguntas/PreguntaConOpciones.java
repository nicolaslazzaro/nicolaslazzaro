package Formularios.Preguntas;

import javax.persistence.*;
import java.util.List;

@Entity
public class PreguntaConOpciones extends PreguntaAdopcion {

  @ElementCollection
  @CollectionTable(name="respuestas_disponibles", joinColumns=@JoinColumn(name="id_pregunta"))
  @Column(name="respuesta_disponible")
  public List<String> respuestasDisponibles;

  public PreguntaConOpciones(String pregunta, Boolean esObligatoria,
                              List<String> opcionesDisponibles){
    super(pregunta, esObligatoria);
    this.respuestasDisponibles = opcionesDisponibles;
  }
}
