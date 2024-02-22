//
//  ItemRow.swift
//  TiendaUi
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ItemRow: View {
    var item: TiendaItem
    var body: some View {
        
        HStack{
            AsyncImage(url: URL(string: item.image), content: {image in image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
            }, placeholder: {
                ProgressView()
            })
            
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.headline)
                Text(item.category)
                    
                Text("\(item.price, specifier: "%.2f")$")
                    .bold()
            
            }
            
        }
    }
}

#Preview {
    ItemRow(item: TiendaItem.ejemplo)
}
