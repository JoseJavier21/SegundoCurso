package com.example.countries.controllers;


import com.example.countries.DTOs.CountryCityDTO;
import com.example.countries.model.Country;
import com.example.countries.services.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/country")
public class CountryController {

    @Autowired
    private CountryService countryService;

    @PostMapping
    public Country save(@RequestBody Country country){
        return countryService.saveCountry(country);
    }

    /*
    @GetMapping
    public List<Country> list(){
        return countryService.listOfCountry();
    }*/

    @GetMapping
    public List<CountryCityDTO> listDTO(){
        return countryService.countriesCities();
    }
}
