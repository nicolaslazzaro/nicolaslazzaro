package Hogares.Api;

import Hogares.Api.entities.HogarDeTransito;
import Hogares.Api.entities.PaginaDeHogares;

import java.io.IOException;
import java.util.List;

public class TestAPI {

  public static void main(String[] args) throws IOException {
    ServicioHogares servicioHogares = ServicioHogares.instance();
    System.out.println("Se inicio el servicio de Hogares");

    List<HogarDeTransito> listaDeHogares = servicioHogares.hogaresDeTransito();

    System.out.println("Se listan a continuacion " + listaDeHogares.size() + " hogares de transito");

    for(HogarDeTransito hogarDeTransito:listaDeHogares){
      System.out.println(hogarDeTransito.nombre);
    }

  }
}
