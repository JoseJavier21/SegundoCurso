//
//  DatosView.swift
//  FuncLogin
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct DatosView: View {

    @EnvironmentObject var model: ViewModel
    
    var body: some View {
      
        
        TabView{
            
            Pestania1()
                .tabItem {
                    Label("Datos", systemImage: "book.pages")
                }
                
            Pestania2()
                .tabItem {
                    Label("Ajustes", systemImage: "square.and.pencil")
                }
        }
        
        
        
    }
}

#Preview {
    DatosView()
        .environmentObject(ViewModel())
}
