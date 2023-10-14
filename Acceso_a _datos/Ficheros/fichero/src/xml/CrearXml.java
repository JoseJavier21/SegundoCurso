package xml;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class CrearXml {

    public void createXml(List<Empleado> empleados) throws ParserConfigurationException, IOException, TransformerException {

        //Creo un objeto documento que va a contener el arbol DOM
        Document document;

        //Creo los objetos builders para construir el documento
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();

        //Asocio los builders al documento
        document = builder.newDocument();

        //Creo el elemento(nodo) raiz del documento
        Element fabric = document.createElement("fabrica");

        //Agrego un atributo al elemento raiz fabrica
        fabric.setAttribute("codigo", "33");

        //Agrego el elemento raiz "fabrica" al documento
        document.appendChild(fabric);

        //Itero sobre la lista de empleados de este metodo espera recibir como argumento
        for(Empleado e: empleados){

            //Creo el elemento empleado

            Element empleado = document.createElement("empleado");

            //Agrego el empleado a la fabrica
            fabric.appendChild(empleado);

            //Creo el id
            Element id = document.createElement("id");

            //Creo el contenido que esta dentro de la etiqueta xml id
            id.appendChild(document.createTextNode(""+e.getId()));

            //Creo el elemento nombre
            Element nombre = document.createElement("nombre");

            //Creo el contenido que esta dentro de la etiqueta xml id
            nombre.appendChild(document.createTextNode(""+e.getNombre()));

            //Creo el elemento email
            Element email = document.createElement("email");

            //Creo el contenido que esta dentro de la etiqueta xml id
            email.appendChild(document.createTextNode(""+e.getEmail()));

            //Agrego id nombre email al empleado
            empleado.appendChild(id);
            empleado.appendChild(nombre);
            empleado.appendChild(email);


        }

        createFile(document);

    }

    public void createFile(Document document) throws TransformerException, IOException {

        //Creo los transformers para tranformar el documento logico en un documento fisico
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();

        //Indico cual es el origen de los datos
        Source source = new DOMSource(document);

        //Creo el objeto de tipo file para indicar el nombre del fichero
        File file = new File("fabrica.xml");

        //Escribo en el fichero
        FileWriter fileWriter = new FileWriter(file);
        PrintWriter printWriter = new PrintWriter(fileWriter);

        //Creo un objeto de tipo result donde almaceno los bytes que voy a escribir
        Result datosParaEscribir = new StreamResult(printWriter);

        //Escribo en el fichero a partir del arbol DOM del documento
        transformer.transform(source,datosParaEscribir);

        System.out.println("algo paso");



    }
}
