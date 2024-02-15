//
//  ContentView.swift
//  CreateSwiftUI
//
//  Created by dam2 on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    
    var landmark: LandMark
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                
                CirculineImage()
                    .frame(height: 200)
                    .offset(x: 35, y: -50)
                    .padding(.bottom, -90)
                
                VStack(alignment: .leading){
                    Text(landmark.name)
                        .padding(.leading)
                        .font(.title)
                        .foregroundStyle(.green)
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
        ContentView(landmark: landMarks[0])
    }
}
