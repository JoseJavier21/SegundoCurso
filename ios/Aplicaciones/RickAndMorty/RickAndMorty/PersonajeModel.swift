//
//  PersonajeModel.swift
//  RickAndMorty
//
//  Created by dam2 on 18/12/23.
//

import Foundation

struct PersonajeModel: Decodable{
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String 
    var episode: [String]
}
