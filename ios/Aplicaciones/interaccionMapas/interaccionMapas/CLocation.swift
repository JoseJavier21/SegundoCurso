//
//  ClLocation.swift
//  interaccionMapas
//
//  Created by dam2 on 18/1/24.
//

import UIKit
import CoreLocation

class CLocation: UIViewController, CLLocationManagerDelegate{
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        requestLocation()
    }
    
    
    func requestLocation(){
        locationManager?.requestLocation()
    }
    
    func requestLocationUpdate(){
        locationManager?.startUpdatingLocation()
    }
    
    func stopLocationUpdate(){
        locationManager?.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("El usuario no lo ha decidido")
            locationManager?.requestWhenInUseAuthorization()
        case .restricted:
            print("Esto esta restringido por control parental")
            self.requestLocationUpdate()
        case .denied:
            print("El usuario a rechazado los permisos")
            self.requestLocationUpdate()
        case .authorizedWhenInUse:
            print("El usuario a dado los permisos mientras se usa")
            self.requestLocationUpdate()
        case .authorizedAlways:
            print("El usuario ha dado los permisos para siempre")
            self.requestLocationUpdate()
        default:
            print("Este es el caso default")
        }
    }
    
    // Funcion deprecated
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .notDetermined:
//            print("El usuario no lo ha decidido")
//        case .restricted:
//            print("Esto esta restringido por control parental")
//        case .denied:
//            print("El usuario a rechazado los permisos")
//        case .authorizedWhenInUse:
//            print("El usuario a dado los permisos mientras se usa")
//        case .authorizedAlways:
//            print("El usuario ha dado los permisos para siempre")
//        default:
//            print("Este es el caso default")
//        }
//        
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print("altitud: \(location.coordinate.latitude), longitud: \(location.coordinate.longitude), Precision: \(location.horizontalAccuracy)")
        if location.horizontalAccuracy < 5{
            print("Esta precision es muy precisa")
            stopLocationUpdate()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("se ha prpoducido un error \(error.localizedDescription)")
    }
    
    
}


