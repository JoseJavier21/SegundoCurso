package com.estech.tienda.controller;

import com.estech.tienda.model.Producto;
import com.estech.tienda.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin({"*"})
@RestController
@RequestMapping("/api")
public class ProductoController {

    @Autowired
    private ProductoService productoService;


    @PostMapping("/producto")
    public Producto save(@RequestBody Producto producto){
        return productoService.saveProduct(producto);
    }

    @GetMapping("/producto/{nombreProducto}")
    public List<Producto> buscarProducto(@PathVariable String nombreProducto){
        return productoService.productByName(nombreProducto);
    }

    @GetMapping("/productos")
    public List<Producto> listaProductos(){
        return productoService.getAll();
    }

    @DeleteMapping("/producto/{id}")
    public void eliminarProducto(@PathVariable Long id){
        productoService.delete(id);
    }

    @PutMapping("/producto/{id}")
    public Producto update(@PathVariable Long id, @RequestBody Producto producto){

        Producto productoEncontrado = productoService.show(id);

        productoEncontrado.setNombreProducto(producto.getNombreProducto());
        productoEncontrado.setPrecio(producto.getPrecio());

        return productoService.saveProduct(productoEncontrado);
    }

    @GetMapping("/producto-by-id/{id}")
    public Producto showProduct(@PathVariable Long id){
        return productoService.show(id);
    }

}
