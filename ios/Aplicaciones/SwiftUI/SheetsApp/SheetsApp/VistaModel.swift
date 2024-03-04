//
//  VistaModel.swift
//  SheetsApp
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct VistaModel: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        ZStack{
            Color.cyan.ignoresSafeArea()
            Button("Saludos cabrones!"){
                isPresented = false
            }
            .foregroundStyle(.white)
            
        }
        
    }
}

#Preview {
    VistaModel(isPresented: .constant(true))
}
