package Mascotas;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "caracteristica")
public class Caracteristica implements Serializable {

  @GeneratedValue @Id
  private long idCaracteristica;
  private String definicion;
  private String valor;

  public Caracteristica( String definicion, String valor) {
    this.definicion = definicion;
    this.valor = valor;
  }

  public String getValor() {
    return valor;
  }

  public String getDefinicion() {
    return definicion;
  }

}
