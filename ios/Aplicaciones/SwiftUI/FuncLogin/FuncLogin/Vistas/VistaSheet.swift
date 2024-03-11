//
//  VistaSheet.swift
//  FuncLogin
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct VistaSheet: View {
    
    @ObservedObject var model: ViewModel
    @State var user: String = "user"
    //var nombre: String = UserDefaults.standard.string(forKey: "usuario" ) ?? ""
    
    var body: some View {
        
        Text("Nombre de usuario: \(user)")
        //Text("Contraseña de usuario: \(model.pass)")
        
    }
    
}

#Preview {
    VistaSheet(model: ViewModel())
}
