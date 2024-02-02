//
//  Funciones.swift
//  Mapas
//
//  Created by dam2 on 1/2/24.
//

import Foundation
import MapKit
import CoreData

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
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let manageContext = appDelegate!.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Locate", in: manageContext)!
        
        let localizacion = NSManagedObject(entity: entity, insertInto: manageContext)
        
        localizacion.setValue(title, forKeyPath: "titulo")
        localizacion.setValue("", forKeyPath: "lat")
        localizacion.setValue("", forKeyPath: "long")
        
        do {
            try manageContext.save()
            
        }catch let error as NSError {
            print("No se ha podido guardar. \(error), \(error.userInfo)")
        }
        
        let ac = UIAlertController(title: "Añadir nuevo Marcador", message: nil, preferredStyle: .alert)
        let aniadir = UIAlertAction(title: "", style: .default, handler: {(action) -> Void in
            var titulo = ac.textFields![0]
            var localizacion = ac.textFields![1]
            titulo.text = title
            
        })
        
        ac.addTextField{( textField: UITextField) in
            textField.placeholder = "Introduce un titlo"
            textField.keyboardType = .default
        }
        ac.addTextField{( textField: UITextField) in
            textField.placeholder = "Nombre de la localización"
            textField.keyboardType = .default
        }
        ac.addAction(aniadir)
        ac.addAction(UIAlertAction(title: "ok", style: .default))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel))
        
        
        return ac
    }
    
//    func showAlert() {
//            // Crear una instancia de UIAlertController
//            let alertController = UIAlertController(title: "Ingrese un valor", message: nil, preferredStyle: .alert)
//
//            // Agregar un UITextField al controlador de alerta
//            alertController.addTextField { (textField) in
//                textField.placeholder = "Ingrese aquí"
//            }
//
//            // Agregar acción de cancelar
//            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//            alertController.addAction(cancelAction)
//
//            // Agregar acción de aceptar
//            let acceptAction = UIAlertAction(title: "Aceptar", style: .default) { (action) in
//                // Acción a realizar cuando se presiona Aceptar
//                if let textField = alertController.textFields?.first {
//                    if let userInput = textField.text {
//                        print("El usuario ingresó: \(userInput)")
//                    }
//                }
//            }
//            alertController.addAction(acceptAction)
//
//            // Presentar el controlador de alerta
//            present(alertController, animated: true, completion: nil)
//        }
    
}
