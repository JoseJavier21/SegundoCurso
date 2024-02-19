//
//  ProductoModel.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ProductoModel: Codable, Hashable{
    
    var id: UUID
    var title: String
    var price: Int
    var description: String
    var category: String
    
    var image: URL{
        URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")!
    }
    
    #if DEBUG
    static let ejemplo = ProductoModel(id: UUID(), title: "producto Ejemplo", price: 23, description: "What do you get? Pancakes! How many do you get? One metric stack! That's equivalent to 1000 millistacks, or a tenth of a kilostack. In short, you get a lot of pancakes.", category: "tecnologia")
    #endif

}

struct ProductoItem: Codable, Hashable, Identifiable{
    var id: UUID
    var title: String
    var price: Int
    var category: String
    var items: [ProductoItem]
}
