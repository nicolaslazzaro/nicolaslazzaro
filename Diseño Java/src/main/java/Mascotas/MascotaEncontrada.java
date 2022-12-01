package Mascotas;

import Formularios.IsEmptyListException;
import Mascotas.Animal;
import Mascotas.Foto;
import Usuarios.Rescatista;
import Utils.Posicion;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity(name = "mascota_encontrada")
public class MascotaEncontrada {

  @Id
  @GeneratedValue
  private Long idMascotaEncontrada;

  private LocalDate fecha;

  @ManyToOne
  private Rescatista rescatista;

  @ElementCollection
  private List<Foto> fotos;

  @OneToOne
  private Animal animal;

  @Embedded
  private Posicion posicionMascota;

  public MascotaEncontrada(LocalDate fecha, Rescatista rescatista, List<Foto> fotos,
                           Animal animal, Posicion posicionMascota) {
    this.fecha = fecha;
    this.rescatista = rescatista;
    if(!fotos.isEmpty()){this.fotos = fotos;}
    else {throw new IsEmptyListException("No hay fotos cargadas");}
    this.animal = animal;
    this.posicionMascota = posicionMascota;
  }

  public LocalDate getFecha() {
    return fecha;
  }

  public Rescatista getRescatista() {
    return rescatista;
  }

  public List<Foto> getFotos() {
    return fotos;
  }

  public Animal getAnimal() {
    return animal;
  }

  public Posicion getPosicionMascota() {
    return posicionMascota;
  }


}
