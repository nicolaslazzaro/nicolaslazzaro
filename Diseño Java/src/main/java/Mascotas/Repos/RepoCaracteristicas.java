package Mascotas.Repos;

import Mascotas.Caracteristica;
import org.uqbarproject.jpa.java8.extras.WithGlobalEntityManager;

import java.util.List;

// Converti al repo de caracteristicas en un Singelton
public class RepoCaracteristicas implements WithGlobalEntityManager {

  private static final RepoCaracteristicas INSTANCE  = new RepoCaracteristicas();

  private RepoCaracteristicas(){
  }

  public static RepoCaracteristicas getInstance(){
    return INSTANCE;
  }

  public Boolean esValida(Caracteristica unaDefinicion){
    return this.getCaracteristicas().contains(unaDefinicion);
  }

  public void agregarCaracteristica(Caracteristica unaDefinicion){
    entityManager().persist(unaDefinicion);
  }

  public List<Caracteristica> getCaracteristicas() {
    return entityManager().createNativeQuery("SELECT * FROM caracteristica").getResultList();
  }
}
