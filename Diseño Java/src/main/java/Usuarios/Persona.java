package Usuarios;

import Usuarios.atributos.Contacto;
import Usuarios.atributos.TipoDocumento;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Entity
public class Persona {

  @Id
  @GeneratedValue
  @Column(name = "persona_id")
  private Long idPersona;

  @Column(name = "persona_nombre",nullable = false)
  private String nombrePersona;

  @Column(name = "persona_apellido",nullable = false)
  private String apellidoPersona;

  @Column(name = "persona_fecha_nac",nullable = false)
  private LocalDate fechaNacimiento;

  @Enumerated(EnumType.STRING)
  @Column(name = "persona_tipo_doc", nullable = false)
  private TipoDocumento tipoDocumento;

  @Column(name = "persona_nro_documento",nullable = false)
  private Integer nroDocumento;

  @OneToMany
  @JoinColumn(name = "contacto_persona",nullable = false)
  private List<Contacto> contactos;

  public Persona(String nombrePersona, String apellidoPersona, LocalDate fechaNacimiento,
                 TipoDocumento tipoDocumento, Integer nroDocumento, List<Contacto> contactos) {
    this.nombrePersona = nombrePersona;
    this.apellidoPersona = apellidoPersona;
    this.fechaNacimiento = fechaNacimiento;
    this.tipoDocumento = tipoDocumento;
    this.nroDocumento = nroDocumento;
    this.contactos = contactos;
  }

  public List<Contacto> getContactos() {
    return contactos;
  }

  public TipoDocumento getTipoDocumento() {
    return tipoDocumento;
  }

  public void registrarContactos(Contacto... contactos) {
    Collections.addAll(this.contactos, contactos);
  }

}
