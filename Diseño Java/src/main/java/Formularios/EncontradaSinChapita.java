package Formularios;

import Formularios.Publicaciones.PublicacionMascotaEncontrada;
import Mascotas.Animal;
import Mascotas.MascotaEncontrada;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity(name = "encontrada_sin_chapita")
public class EncontradaSinChapita {

  @Id
  @GeneratedValue
  private Long idEncontradaSinChapita;

  @OneToOne
  private MascotaEncontrada mascotaEncontrada;

  @OneToOne
  private Animal animal;

  public EncontradaSinChapita(MascotaEncontrada mascotaEncontrada,
                              Animal animal) {
    this.mascotaEncontrada = mascotaEncontrada;
    this.animal = animal;
  }

  public void generarPublicacion(){
    new PublicacionMascotaEncontrada(mascotaEncontrada);
  }

  public MascotaEncontrada getMascotaEncontrada() {
    return mascotaEncontrada;
  }
}
