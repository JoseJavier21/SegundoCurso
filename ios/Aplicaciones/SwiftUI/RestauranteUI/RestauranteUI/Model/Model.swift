//
//  Model.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct MenuItem: Codable, Hashable, Identifiable{
    var id: UUID
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String
    
    var mainImage: String{
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    var thumbailImage: String{
        mainImage + "-thumb"
    }
    
    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "corn-on-the-cob", photoCredit: "tomate", price: 2, restrictions: ["G", "Y"], description: "What do you get? Pancakes! How many do you get? One metric stack! That's equivalent to 1000 millistacks, or a tenth of a kilostack. In short, you get a lot of pancakes.")
    #endif

}

struct MenuSection: Codable, Identifiable{
    var id: UUID
    var name: String
    var items: [MenuItem]
}

