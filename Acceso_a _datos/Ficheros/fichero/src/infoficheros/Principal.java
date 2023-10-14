package infoficheros;

import java.io.File;

public class Principal {

    public static void main(String[] args) {

        File file = new File("C:\\carpeta\\ejemplo.txt");

        // Extraer informacion del fichero

        if (file.isFile()){

            //Nombre del fichero
            System.out.println("Nombre: " + file.getName());

            //Ruta del fichero
            System.out.println("Ruta: " + file.getAbsolutePath());

            //Comprobar si el fichero tiene permisos de lectura
            System.out.print("Permiso de lectura? ");

            /*if (file.canRead()){
                System.out.println("Si");
            }else System.out.println("No");*/

            // hacerlo como ternario
            String canRead = file.canRead() ? "Si" : "No";
            System.out.println(canRead);

            // Comprobar si el fichero tiene permisos de escritura
            System.out.print("Permiso de escritura? ");
            String canWrite = file.canWrite() ? "Si" : "No";
            System.out.println(canWrite);

            // Comprobar si el fichero se puede ejecutar
            System.out.print("Se puede ejecutar? ");
            String canexecute = file.canExecute() ? "Si" : "No";
            System.out.println(canexecute);

            // Ver el nombre del directorio padre
            System.out.println("El directorio del padre " + file.getParent());

        }else {
            System.out.println("El archivo no existe");
        }

    }
}
