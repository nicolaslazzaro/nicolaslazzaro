package Formularios.Repos;

import Formularios.Asociacion;
import Utils.Posicion;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class RepoAsociaciones {

  private List<Asociacion> asociaciones;
  private static final RepoAsociaciones INSTACE = new RepoAsociaciones();

  private RepoAsociaciones(){
    this.asociaciones = new ArrayList<>();
  }
  public static RepoAsociaciones getInstance() {
    return INSTACE;
  }
  public List<Asociacion> getAsociacions() {
    return asociaciones;
  }

//  Devuelve la Asociacion mas cercana a la posicion ingresada
  public Asociacion laMasCercanaA(Posicion posicion){
    List<Double> distanciasOrdenadas = this.asociaciones.stream().
        map(a -> a.getPosicion().distanciaHasta(posicion)).
        sorted().collect(Collectors.toList());
    Double distanciaMasCercana = distanciasOrdenadas.get(0);
    return this.asociaciones.stream().
        filter(a -> a.getPosicion().distanciaHasta(posicion) == distanciaMasCercana).
        collect(Collectors.toList()).
        get(0);
  }

  private void agregarAsociacion(Asociacion asociacion){
    this.asociaciones.add(asociacion);
  }

}
