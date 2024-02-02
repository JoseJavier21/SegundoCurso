package cuenta;

public class Cuenta {

    private int saldo = 50;

    public int getSaldo(){
        return saldo;
    }

    public void retirada(int cantidad){

        saldo -= cantidad;

    }
}
