package escribiryleer;

import java.io.*;
import java.util.Scanner;

public class Principal {

    public static void main(String[] args) throws IOException {

        // Escribir ficheros

        File file = new File("mi_carpeta\\mi_fichero.txt");

        if (file.isFile()){

            try(FileWriter fw = new FileWriter(file, true)){

                fw.write("Escribiendo un texto" + "\r\n");
                System.out.println("Se ha escrito correctamente");
                fw.close();

            }catch(IOException e){
                System.out.println("Se ha producido un error " + e.getMessage());
            }

        }else{
            System.out.println("El fichero no exite");
        }

        // Leer fichero

        BufferedReader bfReader = new BufferedReader(new FileReader(file));

        String line = "";

        while( (line = bfReader.readLine()) != null ){
            //System.out.println(line);
        }

        // Escribir fichero usando el buffer de escritura

        Scanner scaner = new Scanner(System.in);

        System.out.println("Escribe un texto");

        try( BufferedWriter bfwriter = new BufferedWriter(new FileWriter(file, true))) {

            bfwriter.write(scaner.nextLine());
            bfwriter.close();

        }catch(IOException e){
            System.out.println("Error" + e.getMessage());
        }

    }
}
