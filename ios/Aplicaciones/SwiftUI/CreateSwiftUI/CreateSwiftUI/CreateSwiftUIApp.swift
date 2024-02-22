//
//  CreateSwiftUIApp.swift
//  CreateSwiftUI
//
//  Created by dam2 on 12/2/24.
//

import SwiftUI

@main
struct CreateSwiftUIApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            LandMarksList()
                .environment(modelData)
        }
    }
}
