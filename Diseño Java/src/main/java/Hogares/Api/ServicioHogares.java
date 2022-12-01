package Hogares.Api;

import Hogares.Api.entities.HogarDeTransito;
import Hogares.Api.entities.PaginaDeHogares;
import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ServicioHogares {
  private static ServicioHogares instance = null;
  private static int maximaCantidadRegistrosDefault = 10;
  private static final String urlApi = "https://api.refugiosdds.com.ar/api/";
  private Retrofit retrofit;


  public ServicioHogares() {

    TokenInterceptor interceptor = new TokenInterceptor();

    OkHttpClient client = new OkHttpClient.Builder()
        .addInterceptor(interceptor)
        .build();

    this.retrofit = new Retrofit.Builder().
        client(client).
        baseUrl(urlApi).
        addConverterFactory(GsonConverterFactory.create()).
        build();
  }

  public static ServicioHogares instance() {
    if (instance == null) {
      instance = new ServicioHogares();
    }
    return instance;
  }

  public PaginaDeHogares paginaDeHogares(int offset) throws IOException {
    HomeService homeService = this.retrofit.create(HomeService.class);
    Call<PaginaDeHogares> requestHogares = homeService.getHogares(offset);
    Response<PaginaDeHogares> responseHogares = requestHogares.execute();
    return responseHogares.code() == 200? responseHogares.body(): null;
  }

  public List<HogarDeTransito> hogaresDeTransito() throws IOException {
    List<HogarDeTransito> listaDeHogares = new ArrayList<>();
    int i = 1;
    PaginaDeHogares pagina = this.paginaDeHogares(i);
    while (pagina != null){
      listaDeHogares.addAll(pagina.hogares);
      i++;
      pagina = this.paginaDeHogares(i);
    }


    return listaDeHogares;
  }

  public List<HogarDeTransito> hogaresParaPerros() throws IOException {
    return this.hogaresDeTransito().stream()
        .filter(hogar -> hogar.admisiones.isPerros())
        .collect(Collectors.toList());
  }

  public List<HogarDeTransito> hogaresParaGatos() throws IOException {
    return this.hogaresDeTransito()
        .stream().filter(hogar -> hogar.admisiones.isGatos())
        .collect(Collectors.toList());
  }

  public List<HogarDeTransito> hogaresMixtos() throws IOException {
    return this.hogaresDeTransito().stream()
        .filter(hogar -> hogar.admisiones.isGatos() && hogar.admisiones.isPerros())
        .collect(Collectors.toList());
  }

}

