//
//  ContentView.swift
//  SheetsApp
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        
        VStack {
            
            Button("abrir"){
                isPresented = true
            }
            
        }
        .padding()
//        .fullScreenCover(isPresented: $isPresented, onDismiss: {isPresented = false}, content: {
//            VistaModel(isPresented: $isPresented)
//        })
        .sheet(isPresented: $isPresented, onDismiss: {isPresented = false}, content: {
            VistaModel(isPresented: $isPresented)
                .presentationDetents([.large, .medium, .fraction(0.3)])
        })
        
        
        
    }
}

#Preview {
    ContentView()
}
