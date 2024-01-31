package ejercicios.abogados.repository;

import ejercicios.abogados.model.AbogadoModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositoryAbogado extends JpaRepository<AbogadoModel, String> {


}
