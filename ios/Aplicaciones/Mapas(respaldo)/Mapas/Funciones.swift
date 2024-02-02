//
//  Funciones.swift
//  Mapas
//
//  Created by dam2 on 1/2/24.
//

import Foundation
import MapKit

class Funciones{
    
    func settings(location: CLLocationCoordinate2D) -> MKCoordinateRegion{
        
        let radio: CLLocationDistance = 1500
        let centradoMapa = MKCoordinateRegion(center: location, latitudinalMeters: radio, longitudinalMeters: radio)
        return centradoMapa
    }
    
    func createTag(title: String, coordinate: CLLocationCoordinate2D, location: String) -> MKAnnotation{
        return TagModel(coordinate: coordinate, title: title, location: location)
    }


    
    
}
