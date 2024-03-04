//
//  DatosView.swift
//  FuncLogin
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct DatosView: View {
    
    @State var isPresent: Bool = false
    
    var body: some View {
        
        Spacer()
        
        Image(systemName: "person")
            .frame(width: 150, height: 150)
            .background(.red)
            .padding(40)
        
        
        Button("Mostrar Usuario"){
            isPresent = true
        }
        .sheet(isPresented: $isPresent, onDismiss: {isPresent = false}, content: {
            Text("usuario")
                .presentationDetents([.fraction(0.2)])
        })
    

        TabView{
            
            Pestania1()
                .tabItem {
                    Label("Datos", systemImage: "book.pages")
                }
            Pestania2()
                .tabItem {
                    Label("Resgistro", systemImage: "square.and.pencil")
                }
        }
        
        
        
    }
}

#Preview {
    DatosView()
}
