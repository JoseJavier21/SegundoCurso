//
//  ContentView.swift
//  CreateSwiftUI
//
//  Created by dam2 on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ModelData.self) var modelData
    
    var landmark: LandMark
    
    var landmarkIndex: Int{
        modelData.landMarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            
            VStack{
                
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                
                CirculineImage()
                    .frame(height: 200)
                    .offset(x: 35, y: -60)
                    .padding(.bottom, -70)
                
                VStack(alignment: .leading){
                    HStack {
                        Text(landmark.name)
                            .padding(.leading)
                            .font(.title)
                        .foregroundStyle(.green)
                        FavoritesButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                    }
                    HStack{
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                    }
                    .padding(.horizontal, 20.0)
                    
                    Divider()
                                        
                    Text(landmark.description)
                        .padding([.top, .leading, .trailing], 20)
                }
            }
        }
        
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        ContentView(landmark: ModelData().landMarks[0])
            .environment(ModelData())
    }
}
