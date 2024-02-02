package join;

public class Contador extends Thread{

    public Contador(String nombre){
        setName(nombre);
    }

    @Override
    public void run(){

        for(int i = 1; i <= 10; i++){
            System.out.println("Hilo " + getName() + ":" + i);
        }

    }
}
