//
//  MainVista.swift
//  RestauranteUI
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct MainVista: View {
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem {
                    Label("Carta", systemImage: "list.dash")
                }
            VistaOrder()
                .tabItem {
                    Label("Pedido", systemImage: "cart")
                }
        }
        
    }
}

#Preview {
    MainVista()
        .environmentObject(OrderModel())
}
