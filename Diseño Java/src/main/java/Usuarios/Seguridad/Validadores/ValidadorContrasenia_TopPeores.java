package Usuarios.Seguridad.Validadores;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Objects;

public class ValidadorContrasenia_TopPeores implements ValidadorDeContrasenia {

  @Override
  public void validarContrasenia(String contrasenia) {
    boolean esUnaContraseniaInvalida;
    try{
      esUnaContraseniaInvalida = contiene(contrasenia);
    }catch (Exception e){
      throw new InvalidPasswordException("No se ha podido establecer la conexión con el validador de contraseñas comunes. Error: " + e);
    }
    if(esUnaContraseniaInvalida)
      throw new InvalidPasswordException("La contraseña es demasiado común.");

  }

  private boolean contiene(String busqueda) throws URISyntaxException, IOException {
    /* https://github.com/danielmiessler/SecLists/tree/master/Passwords/Common-Credentials */
    return (Files.lines(Paths.get(Objects.requireNonNull(getClass().getClassLoader().getResource("10k-most-common.txt")).toURI()))).anyMatch(linea -> linea.equals(busqueda));

  }
}
