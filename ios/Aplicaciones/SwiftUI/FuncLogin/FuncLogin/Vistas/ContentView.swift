//
//  ContentView.swift
//  FuncLogin
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    
    let defaults = UserDefaults.standard
    
    @State var send: Bool = false
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color.blue
                
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
                    
                    TextField("Nombre de usuario", text: $model.user)
                        .frame(width: 300, height: 40)
                        .background(.gray)
                        .opacity(0.3)
                        .cornerRadius(3)
                        .padding(.top, 20)
                        .foregroundStyle(.black)
                    
                    
                    SecureField("Contraseña", text: $model.pass)
                        .frame(width: 300, height: 40)
                        .background(.gray)
                        .cornerRadius(3)
                        .padding(.top, 15)
                        .opacity(0.3)
                        .foregroundStyle(.black)
                    
                    
                    Button(action: {
                        
                        
                        envio()
                            
                            
                    }){
                        Text("Login")
                            .frame(width: 150, height: 70)
                            .background(.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding(.top, 30)
                    }
                    .fullScreenCover(isPresented: $send, content: {
                        DatosView()
                    })
                    
                    
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
    
    
    func envio(){
        if model.user.lowercased() == "user" && model.pass.lowercased() == "pass" && model.pass.count >= 4{
            
//            defaults.set($user, forKey: "usuario")
//            defaults.set($contra, forKey: "password")
//            
//            defaults.synchronize()
            
            send = true
            print("se envio los datos")
            
        }else{
            
            send = false
            print("no se enviaron los datos")
        }
    }
        
}


#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
