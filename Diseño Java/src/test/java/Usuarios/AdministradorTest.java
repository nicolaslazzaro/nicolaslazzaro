package Usuarios;

import Mascotas.Caracteristica;
import Mascotas.Repos.RepoCaracteristicas;
import Usuarios.Seguridad.Contrasenia;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class AdministradorTest {

  Administrador admin = new Administrador("Admin123", new Contrasenia("contraseñaValida!"));
  Caracteristica estaCastrada = new Caracteristica("Castrada","Si");

  @Test
  public void unAdministradorPuedeCrearUnaCaracteristica() {
    admin.agregarDefinicionCaracteristica(estaCastrada);
    System.out.print(estaCastrada.getDefinicion());
    assertTrue(RepoCaracteristicas.getInstance().getCaracteristicas().contains(estaCastrada));
  }
}
