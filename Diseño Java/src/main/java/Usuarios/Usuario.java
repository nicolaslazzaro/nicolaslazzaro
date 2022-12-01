package Usuarios;

import Usuarios.Seguridad.Contrasenia;
import Usuarios.Seguridad.Validadores.ValidadorContrasenia_IgualAlUsuario;

import javax.persistence.*;
import java.util.List;

@Entity(name = "usuario")
@DiscriminatorColumn(name="tipo_usuario")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class Usuario {

  @Id
  @GeneratedValue
  @Column(name = "usuario_id")
  private Long idUsuario;

  @Column(name = "usuario_nombre",nullable = false)
  protected String nombreUsuario;

  @Embedded
  @Column(name = "usuario_contrasenia",nullable = false)
  protected Contrasenia contrasenia;

  @ElementCollection
  protected List<String> notificaciones; // La idea es que las notificaciones se muestren en la página web y/o
  // app (Como en una campanita o algo asi)

  public Usuario(String nombreUsuario, Contrasenia contrasenia) {
    /* Esto lo agrego acá ya que ahora hay un repositorio de validadores y no me parece muy coherente pasarle a todos
      los validadores el nombre de usuario para que se valide que la contraseña no es igual al nombre de usuario. */
    (new ValidadorContrasenia_IgualAlUsuario(nombreUsuario)).validarContrasenia(contrasenia.getContrasenia());
    this.nombreUsuario = nombreUsuario;
    this.contrasenia = contrasenia;
  }

  public boolean validarLogin(String nombreUsuario, String contrasenia){
    return this.nombreUsuario.equals(nombreUsuario) && this.contrasenia.esIgualA(contrasenia);
  }

  public Long getIdUsuario() {
    return idUsuario;
  }

  public Contrasenia getContrasenia() {
    return contrasenia;
  }

  public String getNombreUsuario() {
    return nombreUsuario;
  }

  public void setNombreUsuario(String nombreUsuario) {
    this.nombreUsuario = nombreUsuario;
  }

  public void notificar(String mensaje){
    notificaciones.add(mensaje);
    // Al ejecutar este método se debería actualizar la lista de notificaciones de la página/app
  }
  public void eliminarNotificacion(String notificacion){
    notificaciones.remove(notificacion);
  }
}
