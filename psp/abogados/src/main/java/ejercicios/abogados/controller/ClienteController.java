package ejercicios.abogados.controller;

import ejercicios.abogados.model.ClienteModel;
import ejercicios.abogados.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("api/cliente")
public class ClienteController {

    @Autowired
    private ClienteService clienteService;

    @PostMapping
    public ClienteModel save(@RequestBody ClienteModel clienteModel){
        return clienteService.save(clienteModel);
    }
}
