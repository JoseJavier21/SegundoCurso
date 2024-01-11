package com.example.encuesta.controller;

import com.example.encuesta.model.Usuario;
import com.example.encuesta.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin({"*"})
@RestController
@RequestMapping("/api/usuario")
public class UsuarioController {


    @Autowired
    private UsuarioService usuarioService;


    @PostMapping
    public void save(@RequestBody Usuario usuario){
         usuarioService.guardarUsuario(usuario);
    }






}
