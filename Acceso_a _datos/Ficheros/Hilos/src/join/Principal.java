package join;

public class Principal {

    public static void main(String[] args) throws InterruptedException {

        Contador contador = new Contador("Contador");
        Contador contador1 = new Contador("Contador 1");
        Contador contador2 = new Contador("Contador 2");
        Contador contador3 = new Contador("Contador 3");

        contador.start();
        contador1.start();
        contador2.start();
        contador3.start();

        contador.join();
        contador1.join();
        contador2.join();
        contador3.join();

        System.out.println(".... Programa Finalizado");

    }
}
