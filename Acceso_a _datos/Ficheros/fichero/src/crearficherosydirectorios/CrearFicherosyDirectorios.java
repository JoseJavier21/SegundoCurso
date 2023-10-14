package crearficherosydirectorios;

import javax.crypto.spec.PSource;
import java.io.File;
import java.io.IOException;

public class CrearFicherosyDirectorios {

    public void createFilesandDirectories() throws IOException {

        // Crear fichero

        File file = new File("ejemplo.txt");
        file.createNewFile();

        // Crear carpeta

        File carpeta = new File("mi_carpeta");
        carpeta.mkdir();

        // Crear fichero en una ruta absoluta

        File ficheroRutaAbsoluta= new File("C:\\carpeta\\ejemplo.txt");
        ficheroRutaAbsoluta.createNewFile();

        // Listar ficheros de un directorio

        String directorio = "C:\\carpeta";

        File rutaDirectorio = new File(directorio);
        String[] ficheros = rutaDirectorio.list();

        for (int i = 0; i < ficheros.length; i++){
            System.out.println(ficheros[i]);
        }

        // Verificar si un archivo existe

        File ficheroBuscado = new File("C:\\carpeta\\ejemplo.txt");

        if (ficheroBuscado.isFile()){
            System.out.println("El fichero existe");
        }else{
            System.out.println("El fichero no existe");
        }


        File carpetaBuscado = new File("C:\\carpeta");

        if (carpetaBuscado.isFile()){
            System.out.println("la carpeta existe");
        }else{
            System.out.println("la carpeta no existe");
        }

        // Crear directorios y meter ficheros en esos directorios

        File carpetaUno = new File("carpetaUno");
        File carpetaDos = new File("carpetaDos");

        if(carpetaUno.mkdir()) System.out.println("Carpeta Uno creada");
        if (carpetaDos.mkdir()) System.out.println("Carpeta Dos creada");

        File ficheroUno = new File(carpetaUno, "fchero_uno.txt");
        File ficheroDos = new File(carpetaDos, "fchero_dos.txt");
        File ficheroTres = new File(carpetaDos, "fchero_tres.txt");
        File ficheroCuatro = new File(carpetaDos, "fchero_cuatro.txt");

        if(ficheroUno.createNewFile()) System.out.println("Fichero creado en la carpeta 1 " + ficheroUno.getParent());
        if(ficheroDos.createNewFile()) System.out.println("Fichero creado en la carpeta 2 " + ficheroDos.getParent());
        if(ficheroTres.createNewFile()) System.out.println("Fichero creado en la carpeta 2 " + ficheroTres.getParent());
        if(ficheroCuatro.createNewFile()) System.out.println("Fichero creado en la carpeta 2 " + ficheroCuatro.getParent());


    }

}
