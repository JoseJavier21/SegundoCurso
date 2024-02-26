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
                
                List{
                    
                    ForEach(producto) { tienda in
                        NavigationLink(destination: ProductoDetalle(producto: tienda)) {
                            VistaCelda(producto: tienda)
                        }
                    }
                }
                
                .navigationTitle("Tienda")
                .listStyle(.grouped)
                
                
            }
                
            }
        
}
    
    


#Preview {
    ContentView()
}
