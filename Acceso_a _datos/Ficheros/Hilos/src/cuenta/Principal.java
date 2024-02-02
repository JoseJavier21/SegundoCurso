package cuenta;

public class Principal {

    public static void main(String[] args) {

        Cajero cajero = new Cajero();

        Thread juanito = new Thread(cajero, "juanito");
        Thread marta = new Thread(cajero, "marta");
        //Thread luisa = new Thread(cajero, "luisa");

        juanito.start();
        marta.start();
        //luisa.start();


    }
}
