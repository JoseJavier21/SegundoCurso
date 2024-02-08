package com.example.countries.DTOs;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CountryCityDTO {

    private String country;
    private List<String> ciudades;


}
