//
//  Currency.swift
//  BitcoinPrice
//
//  Created by dam2 on 7/3/24.
//

import SwiftUI

enum Currency: CaseIterable {
    
    case usd
    case gbp
    case eur
    
    var icon: String{
        switch self {
        case .usd:
            return "💵"
        case .gbp:
            return "💷"
        case .eur:
            return "💶"
            
        }
    
    }
    
    var code: String{
        
        switch self {
        case .usd:
            return "USD"
        case .gbp:
            return "GBP"
        case .eur:
            return "EUR"
        }
    }
    
}

struct PriceDetail{
    let currency: Currency
    let rate: String
    
    public init(currency: Currency, rate: String = "___") {
        self.currency = currency
        self.rate = rate
    }
}