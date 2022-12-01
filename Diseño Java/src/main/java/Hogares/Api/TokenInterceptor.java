package Hogares.Api;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

import java.io.IOException;

public class TokenInterceptor implements Interceptor {

  @Override
  public Response intercept(Chain chain) throws IOException {
    Request newRequest=chain.request().newBuilder()
        .header("Authorization","Bearer "+ "zYzS4xsujREo9CbGkxnKnvWZMlYPI3IHCsXdl3NTV84PHVARaF4hjiOgrf32")
        .build();

    return chain.proceed(newRequest);
  }
}
