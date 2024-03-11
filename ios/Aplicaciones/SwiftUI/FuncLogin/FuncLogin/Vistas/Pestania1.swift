//
//  Pestania1.swift
//  FuncLogin
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct Pestania1: View {
    
    @State var isPresent: Bool = false


    var body: some View {
    
        VStack{
            
            Image(ImageResource.avatar)
                .frame(width: 150, height: 150)
                .background(.red)
                .padding(40)
            
            
            Button("Mostrar Usuario"){
                isPresent = true
            }
            .padding(.top, 15)
            .sheet(isPresented: $isPresent, onDismiss: {isPresent = false}, content: {
                VistaSheet(model: ViewModel())
                    .presentationDetents([.fraction(0.5)])
            })
            
        }
    }
    
}

#Preview {
    Pestania1()
}
