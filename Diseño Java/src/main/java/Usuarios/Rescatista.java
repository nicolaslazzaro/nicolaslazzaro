package Usuarios;

import Formularios.Direccion;
import Usuarios.atributos.Contacto;
import Utils.MailSender;

import javax.persistence.*;
import java.util.List;

@Entity(name = "rescatista")
public class Rescatista {

  @Id
  @GeneratedValue
  @Column(name = "recatista_id")
  private Long idRescatista;

  @OneToOne
  @JoinColumn(name = "rescatista_persona",nullable = false)
  private Persona persona;

  @Embedded
  private Direccion direccion;

  public Rescatista(Persona persona, Direccion direccion) {
    this.persona = persona;
    this.direccion = direccion;
  }

  public void notificarPorEmail(MailSender mailSender, String mensaje){
    mailSender.sendEmail("Notificación de Rescate de patitas",mensaje,this.persona.getContactos().get(0).getEmail());
  }

  public Direccion getDireccion() {
    return direccion;
  }

  public List<Contacto> contactos() {
    return this.persona.getContactos();
  }
}
