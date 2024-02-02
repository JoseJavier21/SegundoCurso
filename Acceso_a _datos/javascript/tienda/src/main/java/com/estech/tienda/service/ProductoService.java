package com.estech.tienda.service;

import com.estech.tienda.model.Producto;
import com.estech.tienda.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.util.EnumUtils;

import java.util.List;

@Service
public class ProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    public List<Producto> productByName(String nombreProducto){
        return productoRepository.findByNombreProducto(nombreProducto);
    }

    public List<Producto> getAll(){
        return productoRepository.findAll();
    }

    public void delete(Long id){
        productoRepository.deleteById(id);
    }

    public Producto saveProduct(Producto producto){
        return productoRepository.save(producto);
    }

    public Producto show(Long id){
        return productoRepository.findById(id).orElse(null);
    }


}
