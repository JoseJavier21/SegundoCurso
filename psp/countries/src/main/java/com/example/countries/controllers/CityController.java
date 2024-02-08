package com.example.countries.controllers;

import com.example.countries.DTOs.CityPageableDTO;
import com.example.countries.model.City;
import com.example.countries.services.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/city")
public class CityController {

    @Autowired
    private CityService cityService;

    @PostMapping
    public City save(@RequestBody City city){
        return cityService.saveCity(city);
    }
    /*
    @GetMapping
    public List<City> list(){
        return cityService.listOfCities();
    }*/

    /*
    @GetMapping
    public Page<City> pageableCity(@PageableDefault(page = 0, size = 2) Pageable pageable){
        return cityService.cityPageable(pageable);
    }*/
    @GetMapping
    public CityPageableDTO pageableListDTO(@PageableDefault(page = 0, size = 2) Pageable pageable){
        return cityService.cityPageableDTO(pageable);

    }
}
