//
//  Pestania2.swift
//  FuncLogin
//
//  Created by dam2 on 4/3/24.
//

import SwiftUI

struct Pestania2: View {
    
    @State private var nombre = ""
    @State private var contra = ""
    @State private var recordaruser = false
    @State private var enviado = false
    
    var body: some View {
        
        NavigationStack{
        
            Form{
                
                Section("Datos del usuario"){
                    Text("Nombre: \(nombre)")
                    Text("Contraseña: \(contra)")
                    
                }
                
                Section("Cambiar nombre y contraseña"){
                    TextField("nombre", text: $nombre)

                    TextField("contraseña ", text: $contra)
                    
                    Toggle("recordar contraseña", isOn: $recordaruser)
                        .font(.caption)
                }
                
            }
            
            Button("Guardar"){
                
            }
            .padding(.horizontal, 110)
            .buttonStyle(.borderedProminent)
            .alert("Guardado", isPresented: $enviado){
                //Buttons
            }message: {
                Text("guardado con exito")
            }
            
        }
        
        
    }
    
    
}

#Preview {
    Pestania2()
}
