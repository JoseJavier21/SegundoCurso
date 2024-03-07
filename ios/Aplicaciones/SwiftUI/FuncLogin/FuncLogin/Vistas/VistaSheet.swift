//
//  VistaSheet.swift
//  FuncLogin
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct VistaSheet: View {
    
    @EnvironmentObject var model: ViewModel
    
    //var nombre: String = UserDefaults.standard.string(forKey: "usuario" ) ?? ""
    
    var body: some View {

        
        Text("Nombre de usuario: \(model.user)")
        Text("Contraseña de usuario: \(model.pass)")
    }
}

#Preview {
    VistaSheet()
        .environmentObject(ViewModel())
}
