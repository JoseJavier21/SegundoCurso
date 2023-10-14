package xml;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Principal {

    public static void main(String[] args) throws ParserConfigurationException, IOException, TransformerException {

        List<Empleado> empleados = new ArrayList<>();

        empleados.add(new Empleado(1, "jose", "jose@ag.es"));
        empleados.add(new Empleado(2, "paco", "pago@ag.es"));
        empleados.add(new Empleado(3, "emiio", "emiio@ag.es"));

        CrearXml crear = new CrearXml();
        crear.createXml(empleados);
    }
}
