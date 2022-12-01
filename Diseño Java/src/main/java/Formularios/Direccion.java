package Formularios;

import javax.persistence.*;

@Embeddable
public class Direccion {

  @Column(nullable = false)
  private String localidad;

  @Column(nullable = false)
  private String calle;

  @Column(nullable = false)
  private Integer numero;

  private Integer piso;

  private String depto;

  public Direccion(String localidad, String calle, Integer numero, Integer piso, String depto) {
    this.localidad = localidad;
    this.calle = calle;
    this.numero = numero;
    this.piso = piso;
    this.depto = depto;
  }

  public String getLocalidad() {
    return localidad;
  }

  public String getCalle() {
    return calle;
  }

  public Integer getNumero() {
    return numero;
  }

  public Integer getPiso() {
    return piso;
  }

  public String getDepto() {
    return depto;
  }

}
