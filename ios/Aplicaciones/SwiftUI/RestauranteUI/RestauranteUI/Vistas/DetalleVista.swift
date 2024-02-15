//
//  DetalleVista.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct DetalleVista: View {
    
    let item: MenuItem //almacena el item que se va a mostrar
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing){
//                Image(item.mainImage)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                AsyncImage(
                    url: item.imageUrl,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                Text("Foto: \(item.photoCredit)")
                    .padding(5)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .background(.black)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
    DetalleVista(item: MenuItem.example)
    }
    .navigationBarTitleDisplayMode(.inline)
}
