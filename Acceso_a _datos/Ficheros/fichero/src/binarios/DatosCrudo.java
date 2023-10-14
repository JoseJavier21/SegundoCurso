package binarios;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class DatosCrudo {

    public void writeAndRead() throws IOException, InterruptedException {

        String ruta = "binarios\\ejemplo.bin";

        FileOutputStream fos = new FileOutputStream(ruta, true);

        // Escribe en el binario

        for (int i = 1; i<= 10; i++){

            fos.write(i);
        }

        // Lectura del binario

        FileInputStream fis = new FileInputStream(ruta);

        int i;

        System.out.println("Leyendo del binario");
        Thread.sleep(1000);

        System.out.println("Leyendo del binario");
        Thread.sleep(1000);

        System.out.println("Leyendo del binario");
        Thread.sleep(1000);

        while((i = fis.read()) != -1){
            System.out.println(i);
        }

        fis.close();
    }
}
