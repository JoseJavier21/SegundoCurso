package com.example.countries.services;

import com.example.countries.DTOs.CountryCityDTO;
import com.example.countries.converters.CountryCityConverte;
import com.example.countries.model.Country;
import com.example.countries.repositorys.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CountryService {

    @Autowired
    private CountryCityConverte converter;

    @Autowired
    private CountryRepository countryRepository;

    public Country saveCountry(Country country){
        return countryRepository.save(country);
    }

    public List<Country> listOfCountry(){
        return countryRepository.findAll();
    }

    public List<CountryCityDTO> countriesCities(){
        List<Country> countries= countryRepository.findAll();

        List<CountryCityDTO> countryCityDTOS = new ArrayList<>();

        countries.forEach(country -> {
            countryCityDTOS.add(converter.convertEnEntitytoCountryCityDTO(country));
        });

        return countryCityDTOS;
    }

}
