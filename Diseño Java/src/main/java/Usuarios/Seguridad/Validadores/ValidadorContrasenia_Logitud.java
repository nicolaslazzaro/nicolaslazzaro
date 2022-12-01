package Usuarios.Seguridad.Validadores;

public class ValidadorContrasenia_Logitud implements ValidadorDeContrasenia{
  private final int tamanioMinimo;

  public ValidadorContrasenia_Logitud(int tamanioMinimo) { this.tamanioMinimo = tamanioMinimo; }

  @Override
  public void validarContrasenia(String contrasenia) {
    if (contrasenia.length() < tamanioMinimo)
      throw new InvalidPasswordException("La contraseña es muy corta.");
  }
}
