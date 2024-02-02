package com.example.ejer1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.ejer1.model.Coche;

@Controller
public class TheirdController {
    
    public Map<String, Integer> telefonos(){

        Map<String, Integer> telefonos = new HashMap<>();
        telefonos.put("Julio", 46464654);
        telefonos.put("Joaquin", 47465198);
        telefonos.put("Fernando", 31265435);
        telefonos.put("Vicente", 49446549);
        telefonos.put("Fernando", 4615794);
        return telefonos;
    }

    public String coche(Model model){

        List<Coche> coches = new ArrayList<>();
        Coche coche1 = new Coche("mazda", "3", 25000);
        Coche coche2 = new Coche("mazda", "6", 37000);
        coches.add(coche1);
        coches.add(coche2);
        
        model.addAttribute("coches", coches);
        return "listaCoches";
    }

}


