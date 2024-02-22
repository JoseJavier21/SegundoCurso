//
//  LandMarksList.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import SwiftUI

struct LandMarksList: View {
    
    
    @State private var showFavoriteOnly = false
    @Environment(ModelData.self) var modelData
    
    var filteredLandMark: [LandMark]{
        modelData.landMarks.filter{ landmark  in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //List{
            //VistaCelda(landMark: landMarks[0])
            //VistaCelda(landMark: landMarks[3])
       //}
        
        NavigationSplitView{
            // lista dinamica
            // Usamos este modelo cuando no sea identifiable
            //  List(landMarks, id: \.id){landmark in VistaCelda(landMark: landmark)}
            
            List{
                Toggle(isOn: $showFavoriteOnly){
                    Text("Mostrar solo favoritos")
                }
                ForEach(filteredLandMark){landmark in
                    NavigationLink{
                        ContentView(landmark: landmark)
                    }label: {
                        VistaCelda(landMark: landmark)
                    }
                }
                
            }
            .animation(.default, value: filteredLandMark)
            .navigationTitle("Lista de Parques")
            
        }detail: {
            Text("Selecionar un lugar")
        }
    }
}

#Preview {
    LandMarksList()
        .environment(ModelData())
}

