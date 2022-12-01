package Server;

import spark.Spark;
import spark.debug.DebugScreen;

public class Server {

  public static void main(String[] args) {
    DebugScreen.enableDebugScreen();
    Spark.port(getPort());
    Router.configure();
  }

  private static int getPort() {
    ProcessBuilder processBuilder = new ProcessBuilder();
    if (processBuilder.environment().get("PORT") != null)
      return Integer.parseInt(processBuilder.environment().get("PORT"));
    return 8000;
  }
}
