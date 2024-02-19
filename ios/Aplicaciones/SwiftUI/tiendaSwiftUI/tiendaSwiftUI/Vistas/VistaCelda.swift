//
//  VistaCelda.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct VistaCelda: View {
    
    let producto: ProductoItem
    
    var body: some View {
    
        HStack{
            AsyncImage(
                url: producto.image,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 130)
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
                    .font(.footnote)
                    .padding(.trailing, 50)
            }
            Text("Precio: \(producto.price)")
                .font(.subheadline)
                .padding(.top, 70)
        }
        
    }
}

#Preview {
    VistaCelda(producto: ProductoModel.ejemplo)
}
