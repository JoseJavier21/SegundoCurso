package ejercicios.abogados.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "abogado")
public class AbogadoModel{

    @Id
    private String codigoColegiado;
    private String nombre;
    private String apellidoUno;
    private String apellidoDos;

    @OneToMany(mappedBy = "abogados", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<ClienteModel> clienteModels;
    public AbogadoModel(){}

    public AbogadoModel(String codigoColegiado, String nombre, String apellidoUno, String apellidoDos) {
        this.codigoColegiado = codigoColegiado;
        this.nombre = nombre;
        this.apellidoUno = apellidoUno;
        this.apellidoDos = apellidoDos;
    }

    public String getCodigoColegiado() {
        return codigoColegiado;
    }

    public void setCodigoColegiado(String codigoColegiado) {
        this.codigoColegiado = codigoColegiado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoUno() {
        return apellidoUno;
    }

    public void setApellidoUno(String apellidoUno) {
        this.apellidoUno = apellidoUno;
    }

    public String getApellidoDos() {
        return apellidoDos;
    }

    public void setApellidoDos(String apellidoDos) {
        this.apellidoDos = apellidoDos;
    }

    public List<ClienteModel> getClienteModels() {
        return clienteModels;
    }

    public void setClienteModels(List<ClienteModel> clienteModels) {
        this.clienteModels = clienteModels;
    }
}
