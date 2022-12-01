package Formularios.Repos;

import Formularios.Preguntas.PreguntaAdopcion;
import Formularios.Preguntas.Respuesta;
import org.uqbarproject.jpa.java8.extras.WithGlobalEntityManager;

import java.util.List;

public class RepoRespuestas implements WithGlobalEntityManager {

    private static final Formularios.Repos.RepoRespuestas INSTANCE = new Formularios.Repos.RepoRespuestas();

    public RepoRespuestas() {}

    public static Formularios.Repos.RepoRespuestas getInstance(){
        return INSTANCE;
    }

    public List<Respuesta> getRespuestas() {
        return entityManager().createQuery("SELECT * FROM respuesta").getResultList();
    }

    public void agregarRespuesta(Respuesta respuesta) {
        entityManager().persist(respuesta);
    }

    public boolean existePregunta(Respuesta respuesta){
        return entityManager().contains(respuesta);
    }

}


