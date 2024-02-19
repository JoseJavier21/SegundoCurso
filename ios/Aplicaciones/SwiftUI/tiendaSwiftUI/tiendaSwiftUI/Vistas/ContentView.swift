//
//  ContentView.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var productItem = Bundle.main.decode([ProductoItem].self, from: "productos.json")
    
    var body: some View {
        
        VStack{
            
            NavigationStack{
                
                List{
                    
                    ForEach(productItem){ section in
                        Section(section.title){
                            
                            ForEach(section.items){item in
                                NavigationLink(value: item){
                                    VistaCelda(producto: item)
                                }
                                
                            }
                        }
                        
                    }
                    
                }
                
            }
            .navigationTitle("Tienda")
            .listStyle(.grouped)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: ProductoItem.self){ item in
                VistaCelda(producto: item)
            }
        }
    }
}

#Preview {
    ContentView()
}
