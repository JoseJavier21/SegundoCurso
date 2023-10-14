package binarios;

import binarios.objetosbinarios.EscrituraLecturaObjeto;

import java.io.IOException;

public class Principal {

    public static void main(String[] args) throws IOException, InterruptedException, ClassNotFoundException {

        //DatosCrudo datosCrudo = new DatosCrudo();
        //datosCrudo.writeAndRead();

        EscrituraLecturaObjeto escrituraLecturaObjeto = new EscrituraLecturaObjeto();

        escrituraLecturaObjeto.writeAndRead();
    }
}
