package Usuarios.Seguridad.Validadores;

import java.util.regex.Pattern;

public class ValidadorContrasenia_CaracterEspecial implements ValidadorDeContrasenia{

  @Override
  public void validarContrasenia(String contrasenia) {
    if(!Pattern.matches("^(?=.*[\"\\]\\[{}.\\-_¬!?'¿¡%^,;:´+/()~@#$*°|&<>=]).*$", contrasenia))
      throw new InvalidPasswordException("La contraseña no tiene un carácter especial.");
  }
}
