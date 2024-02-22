//
//  ContentView.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var producto = Bundle.main.decode([ProductoModel].self, from: "productos.json")
    
    var body: some View {
            
            NavigationStack {
                
                Form{
                    ForEach(producto) { tienda in
                        NavigationLink(destination: ProductoDetalle()) {
                            VistaCelda(producto: tienda)
                        }
                    }
                }
                
                .navigationTitle("Shop") //titulo
                .listStyle(.grouped)
                
                
            }
                
            }
        
}
    
    


#Preview {
    ContentView()
}
