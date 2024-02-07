//
//  TagModel.swift
//  PersiMapas
//
//  Created by dam2 on 5/2/24.
//

import Foundation
import MapKit

class TagModel: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var localizacion: String?
    
    
    init(coordinate: CLLocationCoordinate2D, title: String?, localizacion: String){
        self.coordinate = coordinate
        self.title = title
        self.localizacion = localizacion
    }
    
}



