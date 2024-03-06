//
//  VistaOrder.swift
//  RestauranteUI
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct VistaOrder: View {
    
    @EnvironmentObject var order: OrderModel
    
    var body: some View {
        
        NavigationStack{
            
            List{
                
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            
                            Text(item.name)
                            Spacer()
                            Text("\(item.price) €")
                            
                        }
                        
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                Section{
                    NavigationLink("Finalizacion pedido"){
                        CheckoutVista()
                    }
                    
                }
                .disabled(order.items.isEmpty)
                                
            }
            .navigationTitle("Cesta")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
                    .disabled(order.items.isEmpty)
            }
        }
        
    }
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    VistaOrder()
        .environmentObject(OrderModel())
}
