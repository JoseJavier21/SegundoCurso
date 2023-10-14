package eliminarymoverarchivos;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Principal {

    public static void main(String[] args) throws IOException {

        File file = new File("ejemplo.txt");

        //Eliminar fichero

        if (file.delete()) System.out.println("Fichero eliminado");
        else System.out.println("El fichero no se ha podido eliminar");

        // Mover fichero

        String rutaOrigen = "origen/nuevo_archivo.txt";
        String rutaDestino = "destino/nuevo_archivo.txt";

        Path origenPath = Paths.get(rutaOrigen);
        Path destinoPath = Paths.get(rutaDestino);

        Files.move(origenPath, destinoPath);


    }
}
