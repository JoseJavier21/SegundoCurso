//
//  ItemDetail.swift
//  TiendaUi
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ItemDetail: View {
    var item: TiendaItem
       
       var body: some View {
           VStack {
               AsyncImage(url: URL(string: item.image)) { image in
                   image.resizable()
                       .scaledToFit()
                       .frame(width: 200, height: 200)
               } placeholder: {
                   ProgressView()
               }
               
               Text(item.title)
                   .font(.title)
                   .padding()
               
               
               Text(item.description)
                   .padding()
               
               
               Spacer()
               
               
               Button("Comprar"){}
                   .padding(20)
                   .padding(.horizontal, 30)
                   .background(Color.red)
                   .font(.title2)
                   .foregroundColor(.white)
                   .bold()
                   .cornerRadius(10)
                   .padding(.bottom, 100)
               
               
               
           }
           .padding()
         //  .navigationTitle("")
        //.navigationBarTitleDisplayMode(.inline)

       }
   }

#Preview {
    NavigationStack{
        ItemDetail(item: TiendaItem.ejemplo)
            .navigationBarTitleDisplayMode(.inline)
    }
}
