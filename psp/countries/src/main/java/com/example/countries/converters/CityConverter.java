package com.example.countries.converters;

import com.example.countries.DTOs.CityPageableDTO;
import com.example.countries.model.City;
import com.example.countries.repositorys.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CityConverter {

    @Autowired
    private CityRepository cityRepository;

    public CityPageableDTO convertCityPageableDTO(Pageable pageable){

        Page<City> page = cityRepository.findAll(pageable);
        List<City> cities = page.getContent();

        int totalPaginas = page.getTotalPages();
        int elementPerPage = page.getNumberOfElements();

        List<String> citiesString = new ArrayList<>();

        cities.forEach(city -> {
            citiesString.add(city.getCityName());
        });

        return CityPageableDTO.builder().cities(citiesString).numElementsPerPage(elementPerPage).totalPages(totalPaginas).build();
    }
}
