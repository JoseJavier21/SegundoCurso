package ejercicios.abogados.repository;

import ejercicios.abogados.model.ClienteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositoryCliente extends JpaRepository<ClienteModel,Long> {


}
