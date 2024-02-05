//
//  ViewController.swift
//  Mapas
//
//  Created by dam2 on 29/1/24.
//

import UIKit
import MapKit
import CoreData

class ViewController: UIViewController {
    
    let funciones = Funciones()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var swich: UISwitch!
    
    var tags: [TagModel] = []
    
    //Ubicaciones
    let coordenateEsposito = CLLocationCoordinate2D(latitude: 38.092711, longitude: -3.634971)
    let escuelaEstech = CLLocationCoordinate2D(latitude: 38.09429149, longitude: -3.6312538)
    let catedralBaeza = CLLocationCoordinate2D(latitude: 37.99018348, longitude: -3.468691128)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(gestureReconizer:)))
         mapView.addGestureRecognizer(tapGesture)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        
        _ = NSFetchRequest<NSManagedObject>(entityName: "Lugar")
        
        crearTag(title: "El Pósito", coordinate: coordenateEsposito, location: "Linares")
        //crearTag(title: "Estech", coordinate: escuelaEstech, location: "Linares")
        crearTag(title: "Catedral Baeza", coordinate: catedralBaeza, location: "Baeza")
        
        //settings(location: CLLocation(latitude: 38.092711, longitude: -3.634971))
                  
        
        // Zoom y centrado
        mapView.setRegion(funciones.settings(location: escuelaEstech), animated: true)
        
        
    }
    
    
    @IBAction func addNew(_ sender: Any) {
        
        let nuevo = funciones.alertDialig
        present(nuevo(), animated: true)
    }
    
    
    
    // funcion para crear tags
    func crearTag(title: String, coordinate: CLLocationCoordinate2D, location: String){
        let tagFunc = TagModel(coordinate: coordinate, title: title, location: "")
        mapView.addAnnotation(tagFunc)
        
    }
    
}

extension ViewController: MKMapViewDelegate{
    
    @objc func handleMapTap(gestureReconizer: UITapGestureRecognizer) {
        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location,toCoordinateFrom: mapView)

        // Aquí puedes hacer lo que necesites con las coordenadas
        //print("Latitud: \(coordinate.latitude), Longitud: \(coordinate.longitude)")

        // Por ejemplo, agregar un pin en el lugar que el usuario tocó
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Nuevo Pin"
        
        mapView.addAnnotation(funciones.createTag(title: "Casa", coordinate: annotation.coordinate, location: "Linares"))
        
        
        mapView.addAnnotation(annotation)
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
               
               if annotation.location != "Linares" {
                    view.markerTintColor = .yellow
               }else{
                   view.markerTintColor = .red
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

