//
//  LandMark.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct LandMark: Codable, Hashable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    struct Coordinates: Codable, Hashable{
        var longitude: Double
        var latitude: Double
    }
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
}
