package br.com.viaceploading.service;

import br.com.viaceploading.model.Endereco;
import com.google.gson.Gson;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ViaCepService {

  public Endereco buscar(String cep) throws Exception {
    URL url = new URL("https://viacep.com.br/ws/" + cep + "/json/");
    HttpURLConnection con = (HttpURLConnection) url.openConnection();
    con.setRequestMethod("GET");

    InputStreamReader reader = new InputStreamReader(con.getInputStream());
    return new Gson().fromJson(reader, Endereco.class);
  }
}
