public class HerenciaThread extends Thread{

    public HerenciaThread(String nombre){
        setName(nombre);
    }

    @Override
    public void run() {
        mostrarInfo();
    }

    public int suma(){
        return 5+5;
    }

    public void mostrarInfo(){
        System.out.println("Creando " + getName() + "\nEl resultado de la suma es " + suma());
    }

}
