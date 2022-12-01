package Utils;

import Mascotas.Mascota;
import Usuarios.Duenio;
import Usuarios.Repos.RepoUsuarios;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

public class Recomendador extends TimerTask {

  private List<Mascota> repoMascotas;
  private static Recomendador INSTANCE = null;
  //nose si deberia ser un singleton

  private Recomendador() {
    this.repoMascotas = new ArrayList<>();
  }

  public void cargarMascotas(){
    //TODO
  }

  @Override
  public void run() {
    RepoUsuarios.getInstance().getDuenios().forEach(adoptante -> {
      List<Mascota> mascotas = this.filtrarPorPreferencias(adoptante);
      if (!mascotas.isEmpty()) {
        mascotas.forEach(mascota -> new Recomendacion(mascota).recomendar());
      }
    });

  }

  public static Recomendador instance() {
    if (INSTANCE == null) {
      return new Recomendador();
    } else {
      return INSTANCE;
    }
  }

  public List<Mascota> filtrarPorPreferencias(Duenio adoptante) {
    return null;
    //TODO
  }

  public static void main(String[] args) {
    Recomendador recomendador = Recomendador.instance();
    recomendador.cargarMascotas();
    // falta algo de logica aca
    recomendador.run();

  }
}
