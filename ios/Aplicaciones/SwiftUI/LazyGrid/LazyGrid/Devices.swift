//
//  Devices.swift
//  LazyGrid
//
//  Created by dam2 on 26/2/24.
//

import Foundation

struct Devices: Identifiable, Hashable{
    
    let id = UUID()
    let nombre: String
    let iconName: String
    
    
}

enum DeviceRepository{
    static let all = [
        Devices(nombre: "Airpods", iconName: "airpods"),
        Devices(nombre: "Airpods pro", iconName: "airpodspro"),
        Devices(nombre: "Apple TV", iconName: "appletv"),
        Devices(nombre: "Apple Watch", iconName: "applewatch"),
        Devices(nombre: "HomePod", iconName: "homepod"),
        Devices(nombre: "iPad", iconName: "ipad"),
        Devices(nombre: "iPhone", iconName: "iphone"),
        Devices(nombre: "iPod", iconName: "ipod"),
        Devices(nombre: "Apple Pencil", iconName: "pencil.tip"),
    ]
}
