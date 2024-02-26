//
//  ProductoDetalle.swift
//  tiendaSwiftUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ProductoDetalle: View {
    
    var producto: ProductoModel
    
    @State private var zoomImage = false
    
    var body: some View {
        
        let tapGesture = TapGesture()
            .onEnded {
                withAnimation {
                    zoomImage.toggle()
                }
            }
        
        ScrollView{
            
            VStack{
                
                AsyncImage(
                    url: URL(string: producto.image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: zoomImage ? 290 : 120, height: zoomImage ? 300 : 220)
                            .cornerRadius(zoomImage ? 10 : 0)
                            .shadow(radius: zoomImage ? 10 : 0)
                            .gesture(tapGesture)
                            .rotation3DEffect(.degrees(1), axis: (x: 1.0, y: 20.0, z: 1.0))
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                
                Text(producto.title)
                    .padding(.top, 10)
                    .padding(.bottom, 25)
                    .padding([.leading, .trailing])
                    .font(.title2)
                
                HStack{
                    Text("Rate:")
                    Label("rate:", systemImage: "star.fill")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.yellow)
                    Text(String(format: "%.1f", producto.rating.rate))
                }
                .padding(.trailing, 250)
                
                Label("Descripción:", systemImage: "42.circle")
                    .labelStyle(.titleOnly)
                    .bold()
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Text(producto.description)
                    .padding([.leading, .trailing], 10)
                
                Text("Categoria: \(producto.category)")
                    .padding([.top, .bottom], 30)
                
                HStack{
                    Text("En Stock:")
                    Label("stock", systemImage: "cube.box.fill")
                        .labelStyle(.iconOnly)
                    Text("\(producto.rating.count)")
                }
                .padding(.trailing, 220)
                
                
                Spacer()
            }
            .padding(.top, 30)
            
        }
        Button("Comprar"){
            print("se ha comprado el articulo")
        }
        .padding(.top, 30)
        .frame(width: 400, height: 50)
        .background(.blue)
        .foregroundStyle(.white)
        .font(.title3)
    }
    
    
}

#Preview {
    ProductoDetalle(producto: ProductoModel.ejemplo)
}
