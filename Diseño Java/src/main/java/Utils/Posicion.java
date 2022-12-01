package Utils;

import javax.persistence.Embeddable;

@Embeddable
public class Posicion {

  private Integer posicionEnX;
  private Integer posicionEnY;

  public Posicion(Integer posicionEnX, Integer posicionEnY) {
    this.posicionEnX = posicionEnX;
    this.posicionEnY = posicionEnY;
  }

  public Integer getPosicionEnX() {
    return posicionEnX;
  }

  public Integer getPosicionEnY() {
    return posicionEnY;
  }

  public double distanciaHasta(Posicion posicion){
    return Math.sqrt(Math.pow(posicion.getPosicionEnX() - getPosicionEnX(),2) + Math.pow(posicion.getPosicionEnY() - getPosicionEnY(),2));
  }

}
