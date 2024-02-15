//
//  ContentView.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        VStack {
            
            NavigationStack{
                
                List{
                    ForEach(menu){section in
                        Section(section.name){
                            
                            ForEach(section.items){ item in
                                NavigationLink(value: item){
                                    CeldaVista(item: item)
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: MenuItem.self){ item in
                    DetalleVista(item: item)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
