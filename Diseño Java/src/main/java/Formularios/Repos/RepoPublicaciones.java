package Formularios.Repos;

import Formularios.Publicaciones.PublicacionMascotaEncontrada;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class RepoPublicaciones {

  private List<PublicacionMascotaEncontrada> publicaciones;
  private static final RepoPublicaciones INSTACE = new RepoPublicaciones();

  private RepoPublicaciones(){
      this.publicaciones = new ArrayList<>();
    }
    public static RepoPublicaciones getInstance() {
      return INSTACE;
    }
  public List<PublicacionMascotaEncontrada> getPublicaciones() {
    return publicaciones;
  }

  private List<PublicacionMascotaEncontrada> publicacionesAprobadas(){
    return this.getPublicaciones().stream().filter(PublicacionMascotaEncontrada::getEstaVisible).collect(Collectors.toList());
  }

  private void agregarPublicacion(PublicacionMascotaEncontrada publicacionMascotaEncontrada){
    this.publicaciones.add(publicacionMascotaEncontrada);
  }


}
