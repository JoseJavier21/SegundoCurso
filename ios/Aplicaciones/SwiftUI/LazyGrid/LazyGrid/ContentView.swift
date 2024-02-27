//
//  ContentView.swift
//  LazyGrid
//
//  Created by dam2 on 26/2/24.
//

import SwiftUI

struct ContentView: View {
    
    //let elementos = 1...1000
    let devices = DeviceRepository.all
    let columnas = [
        GridItem(.flexible(minimum: 60, maximum: 100), spacing: 60),
        GridItem(.adaptive(minimum: 60, maximum: 100), spacing: 60),
        GridItem(.flexible(minimum: 60, maximum: 100), spacing: 60),
    ]
    
    var body: some View {

//        LazyVGrid(columns: [GridItem(.flexible(minimum: 60, maximum: 100), spacing: 20),
//                            GridItem(.adaptive(minimum: 50, maximum: 60), spacing: 20),
//                            GridItem(.fixed(60), spacing: 20)
//                           ], content: {
//            Text("Texto 1")
//            Text("Texto 2")
//            Text("Texto 3")
//            Text("Texto 4")
//            Text("Texto 5")
//            Text("Texto 6")
//        })
        
        NavigationView{
            
            ScrollView(.horizontal){
                LazyVGrid(columns: columnas, spacing: 20){
                    ForEach(devices, content: CeldaVista.init)
                }
                .padding(50)
                .navigationTitle("Dispositivos 🍎")
                
            }
            
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
