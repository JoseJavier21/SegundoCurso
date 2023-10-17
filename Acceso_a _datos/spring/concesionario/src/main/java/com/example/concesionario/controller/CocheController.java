package com.example.concesionario.controller;

import com.example.concesionario.models.Coche;
import com.example.concesionario.service.CocheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/car")
public class CocheController {


    @Autowired
    private CocheService cocheService;

    @GetMapping("/all") //http://localhost:8080/api/car/all
    public List<Coche> findcCars(){
        return cocheService.listaCoche();
    }
}
