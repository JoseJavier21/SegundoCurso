//
//  ContentView.swift
//  TiendaUi
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI
struct ContentView: View {
    let tiendaMenu = Bundle.main.decode([TiendaItem].self, from: "productos.json")
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                ForEach(tiendaMenu) { tienda in
                    NavigationLink(destination:
                        ItemDetail(item: tienda)) {
                        ItemRow(item: tienda)
                    }
                }
            }
            
            .navigationTitle("Shop") //titulo
            .listStyle(.grouped)
            .navigationDestination(for: TiendaItem.self) { item in
                ItemDetail(item: item)}
            
        }
            
        }
    }




#Preview {
    ContentView()
}
