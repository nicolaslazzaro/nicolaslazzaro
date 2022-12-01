package Server.Controllers;

import Server.Utils.UserController;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

import java.util.HashMap;
import java.util.Map;

public class Home_Controller {
  public static ModelAndView index(Request request, Response response) {
    Map<String, Object> model = new HashMap<>();
    model.put("usuario", UserController.obtenerUsuario(request));
    return new ModelAndView(model, "home.hbs");
  }
}
