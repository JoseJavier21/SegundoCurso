package com.example.concesionario.controller;


import com.example.concesionario.models.Coche;
import com.example.concesionario.service.CocheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin({"*"})
@RequestMapping("/api") // endpoint
public class CocheRestController {

    @Autowired
    private CocheService cocheService;

    @GetMapping("/all")
    public List<Coche> lista(){
        return cocheService.listaCoche();
    }

    @PostMapping("/save")
    public void save(@RequestBody Coche coche){
        cocheService.guardarCoche(coche);
    }

}
