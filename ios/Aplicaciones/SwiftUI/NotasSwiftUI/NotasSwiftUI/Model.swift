//
//  model.swift
//  NotasSwiftUI
//
//  Created by dam2 on 11/3/24.
//

import Foundation

struct Model: Codable{
    
    let id: String// id unico para cada nota
    let descripcion: String
    var favourite: Bool
    
    init(id: String = UUID().uuidString, description: String, favourite: Bool = false){
        self.id = id
        self.descripcion = description
        self.favourite = favourite
    }
}
