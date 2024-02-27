//
//  CeldaVista.swift
//  LazyGrid
//
//  Created by dam2 on 26/2/24.
//

import SwiftUI

struct CeldaVista: View {
    
    let devices: Devices
    
    var body: some View {
        
        VStack{
            Image(systemName: devices.iconName)
                .font(.largeTitle)
            Text(devices.nombre)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .cornerRadius(3.0)
        
        
    }
}

#Preview {
    CeldaVista(devices: DeviceRepository.all[4])
}
