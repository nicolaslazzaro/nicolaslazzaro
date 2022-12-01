package Formularios.Repos;

import Formularios.Preguntas.PreguntaAdopcion;

import org.uqbarproject.jpa.java8.extras.WithGlobalEntityManager;

import java.util.ArrayList;
import java.util.List;

public class RepoPreguntas implements WithGlobalEntityManager {
  private static final RepoPreguntas INSTANCE = new RepoPreguntas();

  public RepoPreguntas() {}

  public static RepoPreguntas getInstance(){
    return INSTANCE;
  }

  public List<PreguntaAdopcion> getPreguntas() {
    return entityManager().createQuery("SELECT * FROM preguntaadopcion").getResultList();
  }

  public void agregarPregunta(PreguntaAdopcion pregunta) {
    entityManager().persist(pregunta);
  }

  public boolean existePregunta(PreguntaAdopcion pregunta){
    return entityManager().contains(pregunta);
  }

}
