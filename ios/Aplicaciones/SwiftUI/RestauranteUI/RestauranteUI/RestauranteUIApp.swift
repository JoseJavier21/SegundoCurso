//
//  RestauranteUIApp.swift
//  RestauranteUI
//
//  Created by dam2 on 15/2/24.
//

import SwiftUI

@main
struct RestauranteUIApp: App {
    
    @StateObject var order = OrderModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
                
        }
    }
}
