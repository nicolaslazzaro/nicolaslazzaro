package Mascotas;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity(name = "animal")
public class Animal {

  @Id
  @GeneratedValue
  @Column(name = "animal_id")
  private Long idAnimal;

  @Enumerated(EnumType.STRING)
  @Column(name = "animal_especie")
  private Especie especie;

  @Enumerated(EnumType.STRING)
  @Column(name = "animal_sexo")
  private Sexo sexo;

  @OneToMany
  private List<Caracteristica> caracteristicas;

  public Animal(Especie especie, Sexo sexo, List<Caracteristica> caracteristicas) {
    this.especie = especie;
    this.sexo = Objects.requireNonNull(sexo);
    this.caracteristicas = caracteristicas;
  }

  public Especie getEspecie() {
    return especie;
  }

  public Sexo getSexo() {
    return sexo;
  }

  public List<Caracteristica> getCaracteristicas() {
    return caracteristicas;
  }
}
