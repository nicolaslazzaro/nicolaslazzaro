package Server.Utils;

import Usuarios.Repos.RepoUsuarios;
import Usuarios.Usuario;
import spark.Request;

public interface UserController {
  static Boolean estaLogueado(Request req) {
    return req.session().attribute("usuario") != null;
  }

  static Usuario obtenerUsuario(Request req) {
    try {
      long id = req.session().attribute("usuario");
      return RepoUsuarios.getInstance().getUsuario(id);
    }
    catch (Exception e) {
      return null;
    }
  }
}
