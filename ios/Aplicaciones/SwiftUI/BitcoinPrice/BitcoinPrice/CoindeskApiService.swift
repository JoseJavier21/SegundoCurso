//
//  CoindeskApiService.swift
//  BitcoinPrice
//
//  Created by dam2 on 7/3/24.
//

import Foundation
import Combine

struct CoindeskApiService{
    // Instancia Compartira del API service
    public static let shared: CoindeskApiService = CoindeskApiService()
    
    public func fetchBitcoinPrice() -> AnyPublisher<APIResponse, Error>{
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            let error = URLError(.badURL)
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url).tryMap({ data, response in
            // Comprobar que tiene el formato correcto
                guard let httpResponse = response as? HTTPURLResponse else{
                    throw URLError(URLError.unknown)
                }
            
            //Comprobar el status code
            guard httpResponse.statusCode == 200 else {
                    let code = URLError.Code(rawValue: httpResponse.statusCode)
                    throw URLError(code)
                }
                // Si todo haido bien en la peticion, devolvemos data
                return data
        })
        .decode(type: APIResponse.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main) //Recibimos los datos en el hilo principal
        .eraseToAnyPublisher() //Envolvemos el URLSession dataTaskPublisher en un AnyPublisher
    }
}
