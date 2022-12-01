package Server;

import Server.Controllers.*;
import Server.Utils.TemplateViewRoute_NeedLogin;
import Server.Utils.UserController;
import Usuarios.Usuario;
import spark.*;
import spark.template.handlebars.HandlebarsTemplateEngine;

public class Router {

  public static void configure() {
    HandlebarsTemplateEngine engine = new HandlebarsTemplateEngine();

    Spark.staticFiles.location("public");

    Spark.get("/", Home_Controller::index, engine);

    Spark.get("/login", Login_Controller::index, engine);
    Spark.post("/login", Login_Controller::login, engine);

    Spark.post("/logout", Logout_Controller::logout, engine);

    Spark.get("/registrarse", Registararse_Controller::index, engine);
    Spark.post("/registrarse", Registararse_Controller::register, engine);

    Spark.get("/mascota/:idMascota", Mascota_Controller::mostrar);
    postNeedLogin("/mascota/new", Mascota_Controller::registrar, engine);
  }

  private static void getNeedLogin(String path, TemplateViewRoute_NeedLogin route, TemplateEngine engine) {
    Spark.get(path, loginRequerido(route), engine);
  }
  private static void postNeedLogin(String path, TemplateViewRoute_NeedLogin route, TemplateEngine engine) {
    Spark.post(path, loginRequerido(route), engine);
  }

  private static TemplateViewRoute loginRequerido(TemplateViewRoute_NeedLogin route) {
    return (Request req, Response res) -> {
      Usuario usuario = UserController.obtenerUsuario(req);
      if (usuario == null) {
        res.redirect("/login");
        return null;
      } else
        return route.handle(req, res, usuario);
    };
  }
}
