package Server.Controllers;

import spark.ModelAndView;
import spark.Request;
import spark.Response;

public class Logout_Controller {
  public static ModelAndView logout(Request request, Response response) {
    request.session().removeAttribute("usuario");
    response.redirect("/");
    return null;
  }
}
