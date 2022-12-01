package Usuarios.Seguridad.Validadores;

public class ValidadorContrasenia_IgualAlUsuario implements ValidadorDeContrasenia{
  String nombreUsuario;

  public ValidadorContrasenia_IgualAlUsuario(String nombreUsuario) {
    this.nombreUsuario = nombreUsuario;
  }

  @Override
  public void validarContrasenia(String contrasenia) {
    if(contrasenia.equalsIgnoreCase(nombreUsuario))
      throw new InvalidPasswordException("La contraseña es igual al nombre de usuario.");
  }
}
