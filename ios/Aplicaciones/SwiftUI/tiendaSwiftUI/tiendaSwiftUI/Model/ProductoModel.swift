//
//  ProductoModel.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ProductoModel: Codable, Identifiable, Hashable{

    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
    
    #if DEBUG
    static let ejemplo = ProductoModel(id: 1, title: "producto Ejemplo", price: 123, description: "What do you get? Pancakes! How many do you get? One metric stack! That's equivalent to 1000 millistacks, or a tenth of a kilostack. In short, you get a lot of pancakes.", category: "ropa", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: Rating(rate: 13.34, count: 234))
    #endif

}

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}


