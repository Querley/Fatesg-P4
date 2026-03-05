package br.com.viaceploading.util;

public class LoadingAnimation implements Runnable {

  private volatile boolean running = true;

  public void stop() {
    running = false;
  }

  @Override
  public void run() {
    char[] anim = { '|', '/', '-', '\\' };
    int i = 0;

    while (running) {
      System.out.print("\rBuscando CEP " + anim[i++ % anim.length]);
      try {
        Thread.sleep(150);
      } catch (InterruptedException e) {
        break;
      }
    }
    System.out.print("\r");
  }
}
