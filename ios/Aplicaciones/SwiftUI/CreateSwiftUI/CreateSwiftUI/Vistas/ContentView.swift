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
            }
            Spacer()
        }

        
    }
}

#Preview {
    ContentView(landmark: landMarks[0])
}