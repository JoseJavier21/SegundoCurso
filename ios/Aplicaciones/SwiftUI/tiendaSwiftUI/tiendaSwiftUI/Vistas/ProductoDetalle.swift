//
//  ProductoDetalle.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ProductoDetalle: View {
    
    var producto: ProductoModel
    
    var body: some View {
            
        VStack{
         
            Text(producto.title)
//            AsyncImage(
//                url: URL(string: producto.imagen),
//                content: { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 90, height: 130)
//                        .padding(.leading, 10)
//                    },
//                    placeholder: {
//                        ProgressView()
//                    }
//                )
            
        }

    }
}

#Preview {
    ProductoDetalle(producto: ProductoModel.ejemplo)
}
