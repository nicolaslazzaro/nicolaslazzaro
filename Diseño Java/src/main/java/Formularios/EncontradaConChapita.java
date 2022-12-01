package Formularios;

import Mascotas.Mascota;
import Mascotas.MascotaEncontrada;
import Usuarios.atributos.Contacto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.util.List;

@Entity(name = "encontrada_con_chapita")
public class EncontradaConChapita {

  @Id
  @GeneratedValue
  private Long idEncontradaConChapita;

  @OneToOne
  private MascotaEncontrada mascotaEncontrada;

  @OneToOne
  private Mascota mascota;


  public EncontradaConChapita(MascotaEncontrada mascotaEncontrada,Mascota mascota) {
    this.mascotaEncontrada = mascotaEncontrada;
    this.mascota = mascota;
//    mascota.getDuenio().getNotificador().notificar("Han encontrado a su mascota!"); //Notifico al dueño que se encontró a su mascota (Podría estar en un método)
  }

  public MascotaEncontrada getMascotaEncontrada() {
    return mascotaEncontrada;
  }

  public Mascota getMascota() {
    return mascota;
  }

  public List<Contacto> contactarDuenio (){
    return mascota.getDuenio().contactos();
  }//mascota.getDuenio().getContactos()

}
