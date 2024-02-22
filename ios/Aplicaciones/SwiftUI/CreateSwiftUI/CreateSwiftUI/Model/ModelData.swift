//
//  ModelData.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import Foundation

@Observable
class ModelData{
    var landMarks: [LandMark] = load("landmarkData.json")
}
func load<T: Decodable>(_ filename: String)-> T{
   
    let data: Data
    
    //Obtiene el fichero
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No se ha podido encontrar el fichero \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch{
        fatalError("No se ha podido cargar el fichero \(filename):\n\(error)")
    }
    
    // Descodificamos el json
    do {
       let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("No se ha podido parsear el fichero \(filename) como \(T.self):\n\(error)")
    }
    
}
