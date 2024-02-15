//
//  TableView.swift
//  CreateSwiftUI
//
//  Created by dam2 on 14/2/24.
//

import SwiftUI

struct VistaCelda: View {
    
    var landMark: LandMark
    
    var body: some View {
        HStack{
        Text(landMark.name)
            
        Spacer()
        landMark.image
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
                .overlay{
                Circle().stroke(.white,lineWidth: 2)
                }.shadow(radius: 10,y: 10)
        }
        .padding(.leading, 15.0)
    }
}

#Preview("Turtle Rock") {
    Group{
        VistaCelda(landMark: landMarks[0])
        VistaCelda(landMark: landMarks[1])
        VistaCelda(landMark: landMarks[2])
        VistaCelda(landMark: landMarks[3])
        VistaCelda(landMark: landMarks[4])
        VistaCelda(landMark: landMarks[5])
        VistaCelda(landMark: landMarks[6])
    }
}

#Preview("lake Umbagog") {
    VistaCelda(landMark: landMarks[11])
}
