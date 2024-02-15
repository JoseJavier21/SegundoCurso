//
//  MapView.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region))) // para que se actualice el mapa si cambia de valor
    }
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

#Preview {
    if #available(iOS 17.0, *){
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.01894987429268, longitude: -116.1668460998535))
    }else{
        Text("Mapa no disponible, debe actualizar de iOS")
    }
    
}
