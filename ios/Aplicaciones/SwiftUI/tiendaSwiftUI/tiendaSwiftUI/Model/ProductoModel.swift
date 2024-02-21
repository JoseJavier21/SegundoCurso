//
//  ProductoModel.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ProductoModel: Codable, Hashable, Identifiable{
    
    var id: UUID
    var title: String
    var price: Int
    var description: String
    var category: String
    var imagen: String
    var rating: [ProductItem]
    
    #if DEBUG
    static let ejemplo = ProductoModel(id: UUID(), title: "producto Ejemplo", price: 123, description: "What do you get? Pancakes! How many do you get? One metric stack! That's equivalent to 1000 millistacks, or a tenth of a kilostack. In short, you get a lot of pancakes.", category: "ropa", imagen: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", rating: [ProductItem.init(id: UUID(), rate: 10.0, count: 1.0)])
    #endif

}

struct ProductItem: Codable, Hashable, Identifiable{
    var id: UUID
    var rate: Double
    var count: Double
}
