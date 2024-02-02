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
    public Coche save(@RequestBody Coche coche){
     return cocheService.guardarCocheApi(coche);
    }

    @GetMapping("/coche/{id}")
    public Coche searchId(@PathVariable Long id){
        return cocheService.searchById(id);
    }

    @GetMapping("/by-marca/{marca}")
    public List<Coche> mostrarPorMarca(@PathVariable String marca){
        return cocheService.searchByMarca(marca);
    }

    @GetMapping("/by-modelo/{modelo}")
    public List<Coche> mostrarPorModelo(@PathVariable String modelo){
        return cocheService.searchByModelo(modelo);
    }

    @GetMapping("/by-precio/{precio}")
    public List<Coche> mostrarPorPrecio(@PathVariable Double precio){
        return cocheService.searchByPrecio(precio);
    }

    @DeleteMapping("/coche/delete/{id}")
    public void borrarCoche(@PathVariable Long id){ cocheService.deleteCar(id);}

    @PutMapping("/coche/modificar/{id}")
    public Coche modificarCoche(@RequestBody Coche coche, @PathVariable Long id){

        Coche cocheExite = cocheService.searchById(id);

        cocheExite.setMarca(coche.getMarca());
        cocheExite.setModelo(coche.getModelo());
        cocheExite.setPrecio(coche.getPrecio());

        return cocheService.guardarCocheApi(cocheExite);
    }
}
