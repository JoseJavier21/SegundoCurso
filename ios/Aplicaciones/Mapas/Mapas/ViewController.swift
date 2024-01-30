//
//  ViewController.swift
//  Mapas
//
//  Created by dam2 on 29/1/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var swich: UISwitch!
    
    
    
    //Ubicaciones
    let coordenateEsposito = CLLocationCoordinate2D(latitude: 38.092711, longitude: -3.634971)
    let escuelaEstech = CLLocationCoordinate2D(latitude: 38.09429149, longitude: -3.6312538)
    let catedralBaeza = CLLocationCoordinate2D(latitude: 37.99018348, longitude: -3.468691128)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        crearTag(title: "El Pósito", coordinate: coordenateEsposito, location: "Linares")
        crearTag(title: "Estech", coordinate: escuelaEstech, location: "Linares")
        crearTag(title: "Catedral Baeza", coordinate: catedralBaeza, location: "Baeza")
        
        settings(location: CLLocation(latitude: 38.092711, longitude: -3.634971))
        
        
        swich.isOn = false
    }
    
    
    @IBAction func hiddenPlace(_ sender: UISwitch) {
        
        var tagModel: TagModel? = nil
        
        for annotation in mapView.annotations {
            tagModel = (annotation as? TagModel)!
        }
        
        if sender.isOn{
            
            if tagModel!.location == "Linares" {
                mapView.view(for: tagModel!)?.isHidden = false
            }

            print("Se han tenido que ocultar los tags fuera de lianares")
        }
    
        mapView.view(for: tagModel!)?.isHidden = true

        print("Ahora los tendrian que volver a mostrar")
    }
    
    
    // funcion para crear tags
    func crearTag(title: String, coordinate: CLLocationCoordinate2D, location: String){
        let tagFunc = TagModel(coordinate: coordinate, title: title, location: "")
        mapView.addAnnotation(tagFunc)
    }
    
    
    // Zoom y Centrado del mapa
    func settings(location: CLLocation){
        let regionRadius: CLLocationDistance = 1200
        let centradoMapa = MKCoordinateRegion(center: location.coordinate , latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(centradoMapa, animated: true)
    }
    
    // se configuran los tags y se le dan la vista
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
           guard let annotation = annotation as? TagModel else{ return nil }
           
           let idMarker = "marker"
           let view: MKMarkerAnnotationView
           
           if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: idMarker) as? MKMarkerAnnotationView{
               dequeueView.annotation = annotation
               view = dequeueView
           }else {
               view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: idMarker)
               view.canShowCallout = true
               view.calloutOffset = CGPoint(x: -5, y: 5)
               view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
               
               if annotation.location == "Baeza" {
                    view.markerTintColor = .yellow
                }
           }
        
           return view
       }
       
    
        // se le da funcionalidad a los tags
       func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
           let location = view.annotation as! TagModel
           let lanchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
           
           if location.location != "Linares" {
               let lanchOption2 = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
               location.mapItem().openInMaps(launchOptions: lanchOption2)
               
           }else {
               if location.title == "Estech"{
                   let url = URL(string: "https://escuelaestech.es")!
                   UIApplication.shared.open(url)
               }
           }
           
           location.mapItem().openInMaps(launchOptions: lanchOption)
          
       }
       
   



                                      
}

