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


    func alertDialig(title: String, locate: String) -> UIAlertController{
        
        let ac = UIAlertController(title: "Añadir nuevo Marcador", message: nil, preferredStyle: .actionSheet)
        let aniadir = UIAlertAction(title: "", style: .default, handler: {(action) -> Void in
            var titulo = ac.textFields![0]
            var localizacion = ac.textFields![1]
            titulo.text = title
            localizacion.text = locate
            
        })
        
        ac.addTextField{( textField: UITextField) in
            textField.placeholder = "Introduce un titlo"
            textField.keyboardType = .default
        }
        ac.addTextField{( textField: UITextField) in
            textField.placeholder = "Introduce una localia"
            textField.keyboardType = .default
        }
        ac.addAction(aniadir)
        ac.addAction(UIAlertAction(title: "ok", style: .default))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        
        return ac
    }
    
}
