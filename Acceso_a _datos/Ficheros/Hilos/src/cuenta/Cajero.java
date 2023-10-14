package cuenta;

public class Cajero implements Runnable {

    Cuenta cuenta = new Cuenta();

    @Override
    public void run() {

        for (int i = 0; i < 4; i++){

            retiradaDinero(10);

            if(cuenta.getSaldo() <= 0){
                System.out.println("Su cuenta posee un saldo negativo");
            }

            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }

    }

    private synchronized void retiradaDinero(int cantidadRe){

        if (cuenta.getSaldo() >= cantidadRe){

            System.out.println("Saldo actual: " + cuenta.getSaldo());
            System.out.println("El usuario " + Thread.currentThread().getName() + "esta retirando " + cantidadRe);
            cuenta.retirada(cantidadRe);

            System.out.println("Retirada realizada correctamente " + ", el nuevo saldo es " + cuenta.getSaldo());
        }else{

            System.out.println("Señor " + Thread.currentThread().getName() + "no ha suficiente dinero para realizar la retirada");
        }

    }

}
