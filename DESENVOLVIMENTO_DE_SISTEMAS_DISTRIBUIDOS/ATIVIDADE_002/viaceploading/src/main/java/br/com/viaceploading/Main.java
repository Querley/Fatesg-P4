package br.com.viaceploading;

import br.com.viaceploading.model.Endereco;
import br.com.viaceploading.service.ViaCepService;
import br.com.viaceploading.util.CepValidator;
import br.com.viaceploading.util.LoadingAnimation;

import java.util.Scanner;

public class Main {

  public static void main(String[] args) throws Exception {

    Scanner sc = new Scanner(System.in);
    System.out.print("Informe o CEP: ");
    String cep = sc.nextLine();

    if (!CepValidator.valido(cep)) {
      System.out.println("CEP inválido.");
      return;
    }

    LoadingAnimation anim = new LoadingAnimation();
    Thread tAnim = new Thread(anim);
    tAnim.start();

    ViaCepService svc = new ViaCepService();
    Endereco e = svc.buscar(cep);

    anim.stop();
    tAnim.join();

    if (e.erro) {
      System.out.println("CEP não encontrado.");
      return;
    }
    System.out.println(
        "Logradouro: " + e.logradouro +
            ", Bairro: " + e.bairro +
            ", Cidade: " + e.localidade +
            ", UF: " + e.uf);
  }
}
