package binarios.objetosbinarios;

import java.io.*;

public class EscrituraLecturaObjeto {

    public void writeAndRead() throws IOException, InterruptedException, ClassNotFoundException {

        // Escritura

        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("binarios\\personas.bin"));

        oos.writeObject(new Persona("Pepe", "sfgsdfjf@gmail.com"));
        oos.writeObject(new Persona("Luis", "jkjkgjk@gmail.com"));
        oos.writeObject(new Persona("Marta", "adfdakshgv@gmail.com"));

        System.out.println("Objeto añadido");

        oos.close();

        // Lecuta

        ObjectInputStream ois = new ObjectInputStream(new FileInputStream("binarios\\personas.bin"));

        System.out.println("Procesando datos");
        Thread.sleep(1000);
        System.out.println("Procesando datos");
        Thread.sleep(1000);
        System.out.println("Procesando datos");
        Thread.sleep(1000);

        try{

            while(true){

                Persona persona = (Persona) ois.readObject();

                System.out.println(persona.getNombre() + " email" + persona.getEmail());
            }

        }catch (Exception e){
            return;
        }

    }
}
