package Hogares.Api.entities;

import Mascotas.Mascota;

import java.util.List;

public class HogarDeTransito {
  public String id;
  public String nombre;
  public Ubicacion ubicacion;
  public String telefono;
  public Admisiones admisiones;
  public int capacidad;
  public int lugaresDisponibles;
  public boolean patio;
  public List<String> caracateristicas;

  public boolean admicionEspecie(Mascota mascota) {
    return (mascota.getAnimal().getEspecie().isGato() && admisiones.isGatos())
        || (mascota.getAnimal().getEspecie().isPerro() && admisiones.isPerros());
  }

  public boolean hayLugar(){
    return this.lugaresDisponibles != 0;
  }

  public boolean estaCerca(Ubicacion ubicacion){
    return false;
    //TODO
  }

  public boolean admisionTamanio(){
    return false;
    //TODO
  }

  public class Admisiones {
    private boolean perros;
    private boolean gatos;

    public boolean isPerros() {
      return perros;
    }

    public boolean isGatos() {
      return gatos;
    }
  }

  public class Ubicacion {
    private String direccion;
    private float latitud;
    private float longitud;

    public String getDireccion() {
      return direccion;
    }
  }

}
