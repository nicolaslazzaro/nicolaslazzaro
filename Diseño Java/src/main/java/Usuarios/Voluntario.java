package Usuarios;

import Formularios.Publicaciones.PublicacionMascotaEncontrada;
import Usuarios.Seguridad.Contrasenia;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value="Voluntario")
public class Voluntario extends Usuario{


  public Voluntario(String nombreUsuario, Contrasenia contrasenia) {
    super(nombreUsuario, contrasenia);
  }

  public void aprobarPublicacion(PublicacionMascotaEncontrada publicacionMascotaEncontrada){
    publicacionMascotaEncontrada.aprobar();
  }
}
