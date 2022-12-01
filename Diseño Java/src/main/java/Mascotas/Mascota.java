package Mascotas;

import Usuarios.Duenio;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity(name = "mascota")
public class Mascota {

  @Id
  @GeneratedValue
  @Column(name = "mascota_id")
  private Long idMascota;

  @ManyToOne
  @JoinColumn(name = "mascota_animal",nullable = false)
  private Animal animal;

  @Column(name = "mascota_nombre",nullable = false)
  private String nombre;

  @Column(name = "mascota_apodo",nullable = false)
  private String apodo;

  @Column(name = "mascota_edad_aproximada",nullable = false)
  private Integer edadAproximada;

  @ElementCollection
  private List<Foto> fotos;

  @Column(name = "mascota_codigo",nullable = false)
  private String codigo;

  @ManyToOne
  @JoinColumn(name = "mascota_duenio",nullable = false)
  private Duenio duenio;

  public Mascota(Animal animal,
                 String nombre, String apodo,
                 Integer edadApoximada,
                 List<Foto> fotos,
                 String codigo) {
    this.animal = animal;
    this.nombre = nombre;
    this.apodo = apodo;
    this.edadAproximada = edadApoximada;
    this.fotos = fotos;
    this.codigo = Objects.requireNonNull(codigo);
  }


  public Animal getAnimal() {
    return animal;
  }

  public String getNombre() {
    return nombre;
  }

  public String getApodo() {
    return apodo;
  }

  public Integer getEdadAproximada() {
    return edadAproximada;
  }

  public List<Foto> getFotos() {
    return fotos;
  }

  public String getCodigo() {
    return codigo;
  }

  public void setDuenio(Duenio duenio) {
    this.duenio = duenio;
  }

  public Duenio getDuenio(){
    return duenio;
  }

}
