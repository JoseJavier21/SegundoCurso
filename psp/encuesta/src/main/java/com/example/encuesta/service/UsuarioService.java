package com.example.encuesta.service;

import com.example.encuesta.model.Aficion;
import com.example.encuesta.model.Usuario;
import com.example.encuesta.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.*;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public void guardarUsuario(Usuario usuario){
         usuarioRepository.save(usuario);
    }

    public Usuario buscarUsuario(Long id){
        return usuarioRepository.findById(id).orElse(null);
    }


}
