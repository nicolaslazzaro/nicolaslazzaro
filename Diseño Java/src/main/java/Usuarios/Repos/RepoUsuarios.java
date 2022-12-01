package Usuarios.Repos;

import Usuarios.Administrador;
import Usuarios.Duenio;
import Usuarios.Usuario;
import Usuarios.Voluntario;
import org.uqbarproject.jpa.java8.extras.WithGlobalEntityManager;

import java.util.List;

public class RepoUsuarios implements WithGlobalEntityManager {

  private static final RepoUsuarios INSTACE = new RepoUsuarios();

  private RepoUsuarios() {}

  public void agregarDuenio(Duenio duenio){
    entityManager().persist(duenio);
  }

  public void agregarAdministrador(Administrador administrador){
    entityManager().persist(administrador);
  }

  public void agregarVoluntario(Voluntario voluntario){
    entityManager().persist(voluntario);
  }

  public static RepoUsuarios getInstance() {
    return INSTACE;
  }

  public List<Administrador> getAdministradores() {
    return entityManager().createQuery("SELECT * FROM Usuario WHERE tipo_usuario = 'Administrador'").getResultList();
  }

  public List<Duenio> getDuenios() {
    return entityManager().createQuery("SELECT * FROM Usuario WHERE tipo_usuario = 'Duenio'").getResultList();
  }

  public List<Voluntario> getVoluntarios() {
    return entityManager().createQuery("SELECT * FROM Usuario WHERE tipo_usuario = 'Voluntario'").getResultList();
  }

  public Usuario getUsuario(long id){
    return entityManager().getReference(Usuario.class, id);
  }

  public List<Usuario> getUsuarios(){
    return entityManager().createQuery("FROM usuario", Usuario.class).getResultList();
  }



}