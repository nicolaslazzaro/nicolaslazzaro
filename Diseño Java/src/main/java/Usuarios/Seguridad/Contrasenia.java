package Usuarios.Seguridad;

import Usuarios.Seguridad.Validadores.RepoValidadores;

import javax.persistence.Embeddable;


@Embeddable
public class Contrasenia {

  private String contrasenia;

  public Contrasenia(String contrasenia) {
    RepoValidadores.instance().validar(contrasenia);
    this.contrasenia = contrasenia;
  }

  public Contrasenia() {

  }

  public String getContrasenia() {
    return contrasenia;
  }

  public boolean esIgualA(String contrasenia){
    return this.contrasenia.equals(contrasenia);
  }
}
