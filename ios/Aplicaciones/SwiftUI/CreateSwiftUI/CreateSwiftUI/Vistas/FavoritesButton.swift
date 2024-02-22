//
//  FavoritesButton.swift
//  CreateSwiftUI
//
//  Created by dam2 on 22/2/24.
//

import SwiftUI

struct FavoritesButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        
        Button{
            isSet.toggle()
        }label: {
            Label("Alternar favorito", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(.yellow)
        }
        
    }
}

#Preview {
    FavoritesButton(isSet: .constant(false))
}
