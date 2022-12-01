package Mascotas.Repos;

import Mascotas.Mascota;
import org.uqbarproject.jpa.java8.extras.WithGlobalEntityManager;

import java.util.List;

public class RepoMascotas implements WithGlobalEntityManager{

  private RepoMascotas(){}

  private static final RepoMascotas INSTANCE  = new RepoMascotas();
  public static RepoMascotas getInstance(){
    return INSTANCE;
  }
  public void agregarMascota(Mascota mascota){
    entityManager().persist(mascota);
  }

  public List<Mascota> getMascotas() {
    return entityManager().createNativeQuery("SELECT * FROM mascota").getResultList();
  }
}
