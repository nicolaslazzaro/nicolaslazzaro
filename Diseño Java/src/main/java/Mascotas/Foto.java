package Mascotas;

import javax.persistence.Embeddable;

@Embeddable
public class Foto {


  private String url;

  public Foto(String url) {
    this.url = url;
  }


}
