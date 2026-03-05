package br.com.viaceploading.util;

public class CepValidator {

  public static boolean valido(String cep) {
    return cep != null && cep.matches("\\d{8}");
  }
}
