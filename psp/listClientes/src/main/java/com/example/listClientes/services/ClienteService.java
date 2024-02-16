package com.example.listClientes.services;


import com.example.listClientes.model.ClienteModel;
import com.example.listClientes.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository clienteRepository;

    public ClienteModel guardarCliente(ClienteModel cliente){
        return clienteRepository.save(cliente);
    }

    public List<ClienteModel> listClientes(){
        return clienteRepository.findAll();
    }

}
