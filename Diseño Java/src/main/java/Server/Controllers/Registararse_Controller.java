package Server.Controllers;

import Usuarios.Duenio;
import Usuarios.Persona;
import Usuarios.Repos.RepoUsuarios;
import Usuarios.Seguridad.Contrasenia;
import Usuarios.Seguridad.Validadores.InvalidPasswordException;
import Usuarios.atributos.TipoDocumento;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Registararse_Controller {
  public static ModelAndView index(Request request, Response response) {
    return new ModelAndView(null, "registrarse.hbs");
  }
  public static ModelAndView register(Request request, Response response) {
    String username = request.queryParams("username");
    String password = request.queryParams("password");

    Contrasenia contrasenia;
    try {
      contrasenia = new Contrasenia(password);
    } catch (InvalidPasswordException e) {
      Map<String, Object> model = new HashMap<>();
      model.put("username", username);
      model.put("invalidPassword", e.getMessage());
      return new ModelAndView(model, "registrarse.hbs");
    }

    if (RepoUsuarios.getInstance().getUsuarios().stream().anyMatch(u -> u.getNombreUsuario().equals(username))) {
      Map<String, Object> model = new HashMap<>();
      model.put("username", username);
      model.put("invalidUsername", "Ese nombre de usuario ya está en uso");
      return new ModelAndView(model, "registrarse.hbs");
    }


    Duenio nuevoUsuario = new Duenio(username,contrasenia,
        new Persona(request.queryParams("nombre"),
            request.queryParams("apellido"),
            LocalDate.parse(request.queryParams("fechaDeNacimiento")),
            TipoDocumento.valueOf(request.queryParams("tipoDocumento")),
            Integer.parseInt(request.queryParams("documento")),
            new ArrayList<>()));
    RepoUsuarios.getInstance().agregarDuenio(nuevoUsuario);
    response.redirect("/login");
    return null;
  }
}
