//
//  ViewController.swift
//  interaccionMapas
//
//  Created by dam2 on 18/1/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let estechCoordenate = CLLocationCoordinate2D(latitude: 38.097574, longitude: -3.613454)
    let segunsitio =  CLLocationCoordinate2D(latitude: 38.345, longitude: -4.4654)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        centradoMapa(location: initialLocation)
        
        //Llamamos a la funcion para crear el primer tag
        createAnnotation(title: "Estech", locationName: "Escuela de aprendizaje", discipline: "escuela", coordinate: estechCoordenate)
        
        //Llamamos a la funcion para crear el segundo tag
        createAnnotation(title: "segundo Tag", locationName: "agun luj", discipline: "otro stio", coordinate: segunsitio)
    }
    
    //Define el punto inicial
    //Linares
    let initialLocation = CLLocation(latitude: 38.097574, longitude: -3.613454)
     
    //Radia del punto o zoom
    let regionRadius: CLLocationDistance = 1000 // 1000 metros
    

    
    //funcion para el centrado de la ubicacion
    func centradoMapa(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    // Creacion de un tag
    func createAnnotation(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D){
                
        let artwork = ArtWork(title: title, locationName: locationName, discipline: discipline, coordinate: coordinate)
        mapView.addAnnotation(artwork)
    }
    
    
}

extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? ArtWork else { return nil }
        
        let identifier = "marker"
        var view:  MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
            
        }else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            //view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! ArtWork
        let lanchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        
        location.mapItem().openInMaps(launchOptions: lanchOption)
    }
    
    
        
}

