//
//  DetalleVista.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

struct DetalleVista: View {
    
    let item: MenuItem //almacena el item que se va a mostrar

    @EnvironmentObject var order: OrderModel
    
    @State private var showPaymentAlert = false
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                AsyncImage(
//                    url: item.mainImage,
//                    content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                        },
//                        placeholder: {
//                            ProgressView()
//                        }
//                    )
//                    .frame(width: UIScreen.main.bounds.width, height: 200)
                Text("Foto: \(item.photoCredit)")
                    .padding(5)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .background(.black)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Añadir al carrito"){
                order.add(item: item)
                showPaymentAlert.toggle()
            }
            
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Articulo añadido a la cesta", isPresented: $showPaymentAlert){
            
            //Buttons
            
        }message: {
            Text("El articulo se ha añadido al pedido")
        }
    }
}

#Preview {
    NavigationStack{
    DetalleVista(item: MenuItem.example)
    }
    .environmentObject(OrderModel())
    .navigationBarTitleDisplayMode(.inline)
}
