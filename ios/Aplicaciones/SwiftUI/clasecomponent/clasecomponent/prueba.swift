//
//  prueba.swift
//  clasecomponent
//
//  Created by dam2 on 22/2/24.
//

import SwiftUI

class UserData: ObservableObject{
    
    @Published var username: String = ""
}

struct ConteentView: View{
    
    @StateObject var userData = UserData()

    var body: some View{
        
        VStack{
            
            Text("Bienvenido, \(userData.username)")
            UserProfileView()
        }
    }
    
}

struct UserProfileView: View {
    
    @Binding var userData: UserData
    
    var body: some View {
        TextField("Introduce tu nombre", text: userData.username)
    }
}

#Preview{
    ConteentView()
}
