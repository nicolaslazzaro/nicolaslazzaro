package Formularios.Publicaciones;

import Formularios.Preguntas.Respuesta;
import Usuarios.Duenio;
import Utils.MailSender;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity(name = "publicacion_querer_adoptar")
public class PublicacionQuererAdoptar {

  @Id
  @GeneratedValue
  private Long idPublicacionQuererAdoptar;

  public LocalDate fecha;

  @ManyToOne
  public Duenio adoptante;

  @ManyToMany
  public List<Respuesta> respuestas;

  public PublicacionQuererAdoptar(List<Respuesta> respuestas, Duenio adoptante) {
    this.fecha = LocalDate.now();
    this.adoptante = adoptante;

  }

  public void enviarEmailEliminarPublicacion(MailSender mailSender, String link){
    mailSender.sendEmail("Link para eliminar publicación","Link: " + link, adoptante.contactos().get(0).getEmail());
  }

  public LocalDate getFecha() {
    return fecha;
  }

  public List<Respuesta> getRespuestas() { return respuestas; }
}
