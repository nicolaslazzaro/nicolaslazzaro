package Hogares.Api;

import Hogares.Api.entities.PaginaDeHogares;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface HomeService {

  @GET("hogares")
  Call<PaginaDeHogares> getHogares(@Query("offset") int offset);
}
