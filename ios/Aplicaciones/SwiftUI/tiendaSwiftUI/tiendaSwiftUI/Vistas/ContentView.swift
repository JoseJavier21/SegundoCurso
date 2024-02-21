//
//  ContentView.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var product = Bundle.main.decode([ProductItem].self, from: "productos.json")
    
    var body: some View {
        
        VStack{
            
            List{
                
                
            }
            
            
        }
        
        
    }
    
    
    
    
}

#Preview {
    ContentView()
}
