package com.example.ejer1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FirstController {

    @GetMapping("/one")
    public String firstMethod(@RequestParam(name= "edad") Integer edad, @RequestParam(name = "nombre") String nombre, Model model){
        model.addAttribute("nombre", nombre);
        model.addAttribute("edad", edad);
        return "viewOne";
    }


    @GetMapping("/two")
    public String secondMethod(){
        return "viewTwo";
    }
}
