package Server.Controllers;

import Server.Utils.UserController;
import Usuarios.Repos.RepoUsuarios;
import Usuarios.Usuario;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Login_Controller {
  public static ModelAndView index(Request request, Response response) {
    if (!UserController.estaLogueado(request))
      return new ModelAndView(null, "login.hbs");
    else {
      response.redirect("/");
      return null;
    }
  }

  public static ModelAndView login(Request request, Response response) {
    String username = request.queryParams("username");
    String password = request.queryParams("password");

    Optional<Usuario> usuario = RepoUsuarios.getInstance().getUsuarios().stream().filter(user -> user.validarLogin(username,password)).findAny();
    if (usuario.isPresent()) {
      request.session().attribute("usuario", usuario.get().getIdUsuario());
      response.redirect("/");
    } else {
      Map<String, Object> model = new HashMap<>();
      model.put("username", username);
      model.put("invalidLogin", true);
      return new ModelAndView(model, "login.hbs");
    }
    return null;
  }
}
