//
//  LandMarksList.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import SwiftUI

struct LandMarksList: View {
    var body: some View {
        //List{
            //VistaCelda(landMark: landMarks[0])
            //VistaCelda(landMark: landMarks[3])
       //}
        
        NavigationSplitView{
            // lista dinamica
            // Usamos este modelo cuando no sea identifiable
            //  List(landMarks, id: \.id){landmark in VistaCelda(landMark: landmark)}
            List(landMarks){landmark in
                NavigationLink{
                    ContentView(landmark: landmark)
                }label: {
                    VistaCelda(landMark: landmark)
                }
            }
            .navigationTitle("Lista de Parques")
            .navigationBarItems(trailing: Button(action: print("hola"), label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }))
    
        }detail: {
            Text("Selecionar un lugar")
        }
    }
}

#Preview {
    LandMarksList()
}

