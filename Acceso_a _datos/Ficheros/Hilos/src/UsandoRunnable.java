public class UsandoRunnable implements Runnable {

    @Override
    public void run() {
        mostrarInfo();
    }

    public int suma(){
        return 5+5;
    }

    public void mostrarInfo(){
        System.out.println("Creando " + Thread.currentThread().getName() + "\nEl resultado de la suma es " + suma());
    }

}
