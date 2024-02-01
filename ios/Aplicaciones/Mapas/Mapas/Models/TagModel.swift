//
//  TagModel.swift
//  Mapas
//
//  Created by dam2 on 29/1/24.
//

import Foundation
import MapKit

class TagModel : NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var location: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, location: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.location = location
        super.init()
    }
    
    //funcion para marcar el item del tag
    
    func mapItem() -> MKMapItem{
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    
}
