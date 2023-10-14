// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {

        //HerenciaThread herenciaThread = new HerenciaThread("Hilo1 - extends");
        //herenciaThread.start();

        UsandoRunnable usandoRunnable = new UsandoRunnable();

        Thread thread = new Thread(usandoRunnable);

        //thread.setName("Hilo 2 - Runnable/Implements");
        //thread.start();
    }
}