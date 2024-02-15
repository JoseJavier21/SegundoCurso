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
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                VStack{
                    Text("Inicio Sesión")
                    TextField("nombre de usuario", text: $user)
                        .padding(10)
                        .background(Color.gray)
                        .cornerRadius(3)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                    SecureField("contraseña", text: $contra)
                        .padding(10)
                        .background(Color.gray)
                        .cornerRadius(3)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                    //        Toggle(isOn: off) {
                    //              Text("Recordar contraseña)
                    //        }
                    
                    Button("Login") {
                        print("Registro completado")
                    }
                    .padding()
                    .padding(.horizontal, 25)
                    .foregroundColor(.white)
                    .background(Color.cyan)
                    .cornerRadius(5)
                    
                    Button("Recuperar contraseña"){
                        print("recuperar contraseña")
                    }
                    .font(.caption)
                    
                }
                .background(Color.white)
                .clipShape(Circle())
                .padding(70)
            }
            .background(Color.blue)
            .clipShape(Circle())
            .padding(30)
            
        }
        .background(Color.cyan)
        .ignoresSafeArea()



    }
}

#Preview {
    ContentView()
}
