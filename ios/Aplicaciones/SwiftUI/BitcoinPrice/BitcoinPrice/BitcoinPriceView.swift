//
//  ContentView.swift
//  BitcoinPrice
//
//  Created by dam2 on 7/3/24.
//

import SwiftUI

extension Color{
    static let bitcoinGreen: Color = .green.opacity(0.9)
}

struct BitcoinPriceView: View {

    @ObservedObject var viewModel: BitcoinPriceModel
    
    //Moneda selecciona
    @State private var selectedCurrency: Currency = .eur
    
    var body: some View {
        VStack {

            Text("Actualizado el \(viewModel.lastUpdate)")
                .padding(.vertical)
                .foregroundColor(.bitcoinGreen)
            
            TabView(selection: $selectedCurrency,
                    content:  {
                ForEach(viewModel.priceDetails.indices, id: \.self){ index in
                    
                    let priceDetail = viewModel.priceDetails[index]
                    PriceDetailsView(priceDetails: priceDetail)
                        .tag(priceDetail.currency)
                }
            })
            .tabViewStyle(PageTabViewStyle())
            
            VStack(spacing: 0){
                
                HStack(alignment: .center){
                    //Cambiar de moneda
                    Picker(selection: $selectedCurrency, content: {
                        
                        Text("\(Currency.usd.icon) \(Currency.usd.code)").tag(Currency.usd)
                        Text("\(Currency.gbp.icon) \(Currency.gbp.code)").tag(Currency.gbp)
                        Text("\(Currency.eur.icon) \(Currency.eur.code)").tag(Currency.eur)
                    }, label: {Text("Currency")})
                    .padding(.leading)
                    Spacer()
                    Button(action: viewModel.onAppear){
                        Image(systemName: "arrow.clockwise")
                            .font(.largeTitle)
                    }
                    .padding(.trailing)
                }
                .tint(.bitcoinGreen)
                .padding(.top)
                
                Link("Power by Coindesk", destination: URL(string: "https://coindesk.com/price/bitcoin")!)
                    .font(.caption)
                
            }
            .tint(.bitcoinGreen)
            
        }
        .onAppear(perform: viewModel.onAppear)
        .pickerStyle(MenuPickerStyle())
        
        
    }
}

#Preview {
    BitcoinPriceView(viewModel: BitcoinPriceModel())
}
