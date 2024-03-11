//
//  ContentView.swift
//  FuncLogin
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var usuairo: String = "user"
    @State var contra: String = "pass"
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
                    
                    TextField("Nombre de usuario", text: $usuairo)
                        .frame(width: 300, height: 40)
                        .background(.gray)
                        .opacity(0.3)
                        .cornerRadius(3)
                        .padding(.top, 20)
                        .foregroundStyle(.black)
                    
                    
                    SecureField("Contraseña", text: $contra)
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
                    
                    
                    Button("Recuperar contraseña"){
                        Pestania2()
                    }
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
        
        if  usuairo.lowercased() == "user" && contra.lowercased() == "pass" && contra.count >= 4{
            
            //var saveUser = UserDefaults.standard.setValue(usuairo, forKey: "user")
                        
            //let savePass = UserDefaults.standard.string(forKey: "pass")
            //model.pass = $pass
            //model.user = "user"
            
            //UserDefaults.standard.synchronize()
            
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
