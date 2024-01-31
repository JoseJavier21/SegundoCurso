package ejercicios.abogados.controller;

import ejercicios.abogados.model.AbogadoModel;
import ejercicios.abogados.service.AbogadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("api/cliente")
public class AbogadoController {

    @Autowired
    private AbogadoService abogadoService;

    @GetMapping
    public List<AbogadoModel> listaAbogados(){
        return abogadoService.listAbogado();
    }
}
