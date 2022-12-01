package Usuarios.atributos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Contacto {

  @Id
  @GeneratedValue
  @Column(name = "contacto_id",nullable = false)
  private Long idContacto;

  @Column(name = "contacto_nombre",nullable = false)
  public String nombreContacto;

  @Column(name = "contacto_apellido",nullable = false)
  public String apellidoContacto;

  @Column(name = "contacto_nro_tel",nullable = false)
  public Integer nroTelefono;

  @Column(name = "contacto_email",nullable = false)
  public String email;


  public Contacto(String nombreContacto, String apellidoContacto, Integer nroTelefono, String email) {
    this.nombreContacto = nombreContacto;
    this.apellidoContacto = apellidoContacto;
    this.nroTelefono = nroTelefono;
    this.email = email;
  }

  public String getNombreContacto() {
    return nombreContacto;
  }

  public String getApellidoContacto() {
    return apellidoContacto;
  }

  public Integer getNroTelefono() {
    return nroTelefono;
  }

  public String getEmail() {
    return email;
  }

}
