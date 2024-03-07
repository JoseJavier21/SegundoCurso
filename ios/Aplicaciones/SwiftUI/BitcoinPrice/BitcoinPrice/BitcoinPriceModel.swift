//
//  BitcoinPriceModel.swift
//  BitcoinPrice
//
//  Created by dam2 on 7/3/24.
//

import Combine

class BitcoinPriceModel: ObservableObject{
    
    // Fecha de la ultima actualizacion
    @Published public private(set) var lastUpdate: String = ""
    
    @Published public private(set) var priceDetails: [PriceDetail] = Currency.allCases.map{
        // Para cada caso de currency creamos un objeto PriceDetauils con ese Currency
        PriceDetail(currency: $0)
    }
    
    //Crear una suscripcion a nuestro Publisher
    private var subscripcion: AnyCancellable? // Subscripcion cancelable
    
    public func onAppear(){
        //Obtener datos de la API
        // Inicializamos la suscripcion
        subscripcion = CoindeskApiService.shared.fetchBitcoinPrice()
            .sink(receiveCompletion: { completion in
                //solo puede devolver .failure o un .finish
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("succes")
                }
            }, receiveValue: { [weak self] value in
                //Actualizar la instacia del viewModel
                guard let self = self else { return }
                // Actualizamos las propiedades publicadas
                self.lastUpdate = value.time.updated
                self.priceDetails = [
                    PriceDetail(currency: .usd, rate: value.bpi.USD.rate),
                    PriceDetail(currency: .gbp, rate: value.bpi.GBP.rate),
                    PriceDetail(currency: .eur, rate: value.bpi.EUR.rate)
                ]
            })
        
    }
    
    // utilizando NetWorkmanaget
//    public func onAppear(){
//        
//        let networkManager = NetworkManager()
//        
//        networkManager.descargarDatosDeApi(){ (APIResponse) in
//            
//            self.lastUpdate = APIResponse.time.updated
//            self.priceDetails = [
//                PriceDetail(currency: .usd, rate: APIResponse.bpi.USD.rate),
//                PriceDetail(currency: .gbp, rate: APIResponse.bpi.GBP.rate),
//                PriceDetail(currency: .eur, rate: APIResponse.bpi.EUR.rate)
//            ]
//            
//        }
//    }
    
}

