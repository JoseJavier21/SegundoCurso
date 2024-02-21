//
//  VistaCelda.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct VistaCelda: View {
    
    let producto : ProductoModel
    
    var body: some View {
    
        HStack{
            AsyncImage(
                url: URL(string: producto.imagen),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 130)
                        .padding(.leading, 10)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            
                Spacer()
            VStack{
                Text(producto.title)
                    .font(.title2)
                    .padding(.bottom, 40)
                    
                Text("Categoria: \(producto.category)")
                    .font(.title3)
                    .padding(.trailing, 30)
            }
            Text("Precio: \(producto.price)€")
                .font(.subheadline)
                .padding(.top, 70)
                .padding(.trailing, 10)
            
        }
        
    }
}

#Preview {
    VistaCelda(producto: ProductoModel.ejemplo)
}
