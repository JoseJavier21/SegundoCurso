//
//  ContentView.swift
//  LoginSwiftUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var contra: String = ""
    @State var user: String = ""
    @State var opcion: Bool = true
    
    var body: some View {
    
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(.cyan)
                .frame(width: 700)
            
            Circle()
                .padding(80)
            
            VStack{
                Text("Inicio de Sesión")
                    .foregroundStyle(.black)
                    .font(.title)
                    .bold()
                    .padding(.top, 100)
                
                TextField("Nombre de usuario", text: $user)
                    .frame(width: 300, height: 40)
                    .background(.gray)
                    .opacity(0.3)
                    .cornerRadius(3)
                    .padding(.top, 20)
                    
                
                SecureField("Contraseña", text: $contra)
                    .frame(width: 300, height: 40)
                    .background(.gray)
                    .cornerRadius(3)
                    .padding(.top, 15)
                    .opacity(0.3)
                    
                
                HStack {
                    
                    Toggle("Recordar Contraseña", isOn: $opcion)
                    .frame(width: 220)
                    .foregroundStyle(.black)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                
                Button("Login") {
                    print("boton de login")
                }
                .frame(width: 150, height: 70)
                .background(.cyan)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding(.top, 30)
                
                
                
                Text("Recuperar contraseña")
                    .foregroundStyle(.cyan)
                    .bold()
                    .padding(.leading, 130)
                    .padding(.top, 20)
            }
            .padding(.bottom, 100)
        }
        .foregroundColor(.white)
 
    }
}

#Preview {
    ContentView()
}
