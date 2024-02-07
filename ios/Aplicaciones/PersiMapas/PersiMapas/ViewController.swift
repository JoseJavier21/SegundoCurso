//
//  ViewController.swift
//  PersiMapas
//
//  Created by dam2 on 5/2/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var ocultarTags: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


extension ViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        <#code#>
    }
    
    // se le da funcionalidad a los tags
   func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
       //let location = view.annotation as! TagModel
       //let lanchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
//       if location.location != "Linares" {
//           let lanchOption2 = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//           location.mapItem().openInMaps(launchOptions: lanchOption2)
//           
//       }else {
//           if location.title == "Estech"{
//               let url = URL(string: "https://escuelaestech.es")!
//               UIApplication.shared.open(url)
//           }
//       }
//       
//       location.mapItem().openInMaps(launchOptions: lanchOption)
      
   }
    
    
    @objc func handleMapTap(gestureReconizer: UITapGestureRecognizer) {
        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location,toCoordinateFrom: mapView)

        // Aquí puedes hacer lo que necesites con las coordenadas
        //print("Latitud: \(coordinate.latitude), Longitud: \(coordinate.longitude)")

        // Por ejemplo, agregar un pin en el lugar que el usuario tocó
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Nuevo Pin"
        
        //mapView.addAnnotation(funciones.createTag(title: "Casa", coordinate: annotation.coordinate, location: "Linares"))
        //mapView.addAnnotation(annotation)
    }
}

