//
//  CeldaVista.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct CeldaVista: View {
    
    let item: MenuItem
    
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        
        HStack{
            Image(item.thumbailImage)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("\(item.price)€")
            }
            Spacer()
            ForEach(item.restrictions, id:\.self){ restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .foregroundStyle(.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        }
        
        // Recorremos las restricciones
        

    }
}

#Preview {
    CeldaVista(item: MenuItem.example)
}
