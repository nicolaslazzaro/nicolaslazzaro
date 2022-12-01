package Usuarios.Seguridad.Validadores;

public class InvalidPasswordException extends RuntimeException{
  public InvalidPasswordException(String message)
  {
    super(message);
  }
}
