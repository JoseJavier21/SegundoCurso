package ejercicios.abogados.service;

import ejercicios.abogados.model.AbogadoModel;
import ejercicios.abogados.repository.RepositoryAbogado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AbogadoService {

    @Autowired
    private RepositoryAbogado repositoryAbogado;

    public List<AbogadoModel> listAbogado(){ return repositoryAbogado.findAll();}
}
