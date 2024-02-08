package com.example.countries.converters;

import com.example.countries.DTOs.CountryCityDTO;
import com.example.countries.model.City;
import com.example.countries.model.Country;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CountryCityConverte {

    public CountryCityDTO convertEnEntitytoCountryCityDTO(Country country){

        CountryCityDTO countryCityDTO = new CountryCityDTO();

        countryCityDTO.setCountry(country.getName());

        List<City> cities = country.getCities();

        List<String> citiesString = new ArrayList<>();

        cities.forEach(city -> {
            citiesString.add(city.getCityName());
        });

        countryCityDTO.setCiudades(citiesString);

        return countryCityDTO;
    }
}
