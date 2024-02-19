package com.example.listClientes.controller;

import com.example.listClientes.model.ClienteModel;
import com.example.listClientes.services.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/cliente")
public class ClienteController {

    @Autowired
    private ClienteService clienteService;

    @PostMapping("/guardar")
    public ClienteModel saveClientes(ClienteModel cliente) {
        return clienteService.guardarCliente(cliente);
    }

    @GetMapping("/lista")
    public List<ClienteModel> listarClientes(){
        return clienteService.listClientes();
    }

}
