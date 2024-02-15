//
//  CirculineImage.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import SwiftUI

struct CirculineImage: View {
    
    var image: Image = Image("turtlerock")
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white,lineWidth: 2)
            }.shadow(radius: 10,y: 10)
    }
}

#Preview {
    CirculineImage()
}
