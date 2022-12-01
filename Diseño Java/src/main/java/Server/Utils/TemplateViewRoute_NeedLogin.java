package Server.Utils;

import Usuarios.Usuario;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

public interface TemplateViewRoute_NeedLogin {
  ModelAndView handle(Request var1, Response var2, Usuario usuario) throws Exception;
}
