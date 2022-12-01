package Usuarios.Seguridad.Validadores;

import java.util.Arrays;
import java.util.Collection;

public class RepoValidadores {

  Collection<ValidadorDeContrasenia> validadores;

  private RepoValidadores(){
    validadores = Arrays.asList(
        new ValidadorContrasenia_CaracterEspecial(),
        new ValidadorContrasenia_Logitud(5),
        new ValidadorContrasenia_TopPeores());
  }
  private static final RepoValidadores INSTANCE = new RepoValidadores();

  public static RepoValidadores instance() {
    return INSTANCE;
  }

  public void validar(String contrasenia){
    validadores.forEach( (ValidadorDeContrasenia validador) -> validador.validarContrasenia(contrasenia) );
  }

}
