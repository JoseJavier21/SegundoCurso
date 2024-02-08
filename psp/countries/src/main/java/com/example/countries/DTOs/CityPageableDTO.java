package com.example.countries.DTOs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class CityPageableDTO {

    private List<String> cities;
    private Integer numElementsPerPage;
    private Integer totalPages;


}
