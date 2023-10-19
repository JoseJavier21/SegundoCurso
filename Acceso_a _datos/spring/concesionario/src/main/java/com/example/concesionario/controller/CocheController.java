package com.example.concesionario.controller;

import com.example.concesionario.models.Coche;
import com.example.concesionario.service.CocheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
//@RestController

//@RequestMapping("/api/car")
public class CocheController {


    @Autowired
    private CocheService cocheService;

    @GetMapping("")
    public String getAll(Model model){
        model.addAttribute("coches", cocheService.listaCoche());
        return "cochesView";
    }

    @GetMapping("/form")
    public String form(Model model){
        model.addAttribute("coche", new Coche());
        return "form";
    }

    @PostMapping("/save")
    public String guardar(Coche coche){
        cocheService.guardarCoche(coche);
        return "redirect:/";
    }


}
