package Formularios.Preguntas;

import javax.persistence.Entity;

@Entity
public class PreguntaSimple extends PreguntaAdopcion{
  public PreguntaSimple(String pregunta, Boolean esObligatiora) {
    super(pregunta, esObligatiora);
  }
}
