package Formularios.Preguntas;

import javax.persistence.*;

@Entity(name = "pregunta_adopcion")
@DiscriminatorColumn(name="tipo_pregunta")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class PreguntaAdopcion {

  @Id
  @GeneratedValue
  private Long idPregunta;

  private String pregunta;
  private Boolean esObligatiora;

  public PreguntaAdopcion(String pregunta, Boolean esObligatiora) {
    this.pregunta = pregunta;
    this.esObligatiora = esObligatiora;
  }

}
