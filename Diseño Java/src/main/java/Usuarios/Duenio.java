package Usuarios;

import Formularios.Asociacion;
import Formularios.Preguntas.Respuesta;
import Formularios.Publicaciones.PublicacionDarEnAdopcion;
import Formularios.Publicaciones.PublicacionQuererAdoptar;
import Mascotas.Mascota;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.atributos.Contacto;

import javax.persistence.*;
import java.util.Collections;
import java.util.List;

@Entity
@DiscriminatorValue(value="Duenio")
public class Duenio extends Usuario {

  @OneToOne
  @JoinColumn(name = "duenio_paersona", nullable = false)
  private final Persona persona;

  public Duenio(String nombreUsuario, Contrasenia contrasenia, Persona persona) {
    super(nombreUsuario, contrasenia);
    this.persona = persona;
  }

  public List<Contacto> contactos() {
    return this.persona.getContactos();
  }

  public void registrarContactos(Contacto... contactos) {
    Collections.addAll(this.persona.getContactos(), contactos);
  }

  public void registrarMascota(Mascota mascota) {
     mascota.setDuenio(this);
  }

  public PublicacionQuererAdoptar quererAdoptar(List<Respuesta> respuestas){
    return new PublicacionQuererAdoptar(respuestas, this);
  }

  public PublicacionDarEnAdopcion darEnAdopcion(Mascota mascota, Asociacion asociacion, List<Respuesta> respuestas) {
    return asociacion.generarPublicacionAdopcion(mascota, respuestas);
  }

  public Persona getPersona() {
    return persona;
  }
}
