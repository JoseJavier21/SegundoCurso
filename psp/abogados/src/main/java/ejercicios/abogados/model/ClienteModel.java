package ejercicios.abogados.model;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "cliente")
public class ClienteModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombreCliente;
    private String apellidoCliente;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "abogado_id")
    private AbogadoModel abogados;

    public ClienteModel() {}

    public ClienteModel(Long id, String nombreCliente, String apellidoCliente) {
        this.id = id;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public AbogadoModel getAbogados() {
        return abogados;
    }

    public void setAbogados(AbogadoModel abogados) {
        this.abogados = abogados;
    }
}
