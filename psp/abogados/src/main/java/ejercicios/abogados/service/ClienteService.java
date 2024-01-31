package ejercicios.abogados.service;

import ejercicios.abogados.model.ClienteModel;
import ejercicios.abogados.repository.RepositoryCliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClienteService {

    @Autowired
    private RepositoryCliente repositoryCliente;

    public ClienteModel save(ClienteModel cliente){
       return repositoryCliente.save(cliente);
    }

}
