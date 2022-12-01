package Formularios.Publicaciones;

import Formularios.Asociacion;
import Mascotas.MascotaEncontrada;
import Formularios.Repos.RepoAsociaciones;
import Utils.MailSender;

import javax.persistence.*;
import java.time.LocalDate;

@Entity(name = "publicacion_mascota_encontrada")
public class PublicacionMascotaEncontrada {

  @Id
  @GeneratedValue
  private Long idPublicacionMascotaEncontrada;

  public LocalDate fecha;

  @ManyToOne
  private Asociacion asociacion;

  @OneToOne
  private MascotaEncontrada mascotaEncontrada;


  private Boolean estaVisible=false;

  public PublicacionMascotaEncontrada(MascotaEncontrada mascotaEncontrada) {
    this.fecha = LocalDate.now();
    this.mascotaEncontrada = mascotaEncontrada;
    this.asociacion = RepoAsociaciones.getInstance().laMasCercanaA(mascotaEncontrada.getPosicionMascota());
  }

  public void aprobar(){
    estaVisible=true;
  }

  public void notificarMascotaIdentificada(MailSender mailsender){ //Método que se ejecutaría cuando alguien identifica a su mascota y clickea un botón para hacerlo saber
    mascotaEncontrada.getRescatista().notificarPorEmail(mailsender,"Alguien ha identificado a la mascota que rescataste!");
  }

  public LocalDate getFecha() {
    return fecha;
  }

  public Asociacion getAsociacion() {
    return asociacion;
  }

  public MascotaEncontrada getMascotaEncontrada() {
    return mascotaEncontrada;
  }

  public Boolean getEstaVisible() {
    return estaVisible;
  }

}
