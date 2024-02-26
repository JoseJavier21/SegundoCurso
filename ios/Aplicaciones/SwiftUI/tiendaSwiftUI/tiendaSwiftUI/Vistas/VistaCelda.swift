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
                url: URL(string: producto.image),
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
            
            VStack{
                Text(producto.title)
                    .font(.headline)
                    .padding([.top, .bottom], 25)
                
                HStack{
                    Text("Categoria: \(producto.category)")
                        .padding(.trailing, 33)
                        .font(.caption)
                    
                    Text("Precio: \(String(format: "%.2f", producto.price))€")
                        .font(.subheadline)
                        .padding(.trailing, 10)
                }
                
            }
            .padding([.leading,.trailing])
            
        }
        
    }
}

#Preview {
    VistaCelda(producto: ProductoModel.ejemplo)
}
