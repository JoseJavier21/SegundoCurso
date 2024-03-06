//
//  CheckoutVista.swift
//  RestauranteUI
//
//  Created by dam2 on 6/3/24.
//

import SwiftUI

struct CheckoutVista: View {
    
    @EnvironmentObject var order: OrderModel
    
    //Formas de pago
    let paymentTypes = ["Efectivo", "Tarjeta de credito", "Puntos", "Google Pay", "Apple Pay"]
    @State private var paymentType = "Efectivo"
    
    //Codigo de descuento
    @State private var addCuponDetails = false
    @State private var cuponCode = ""
    
    //Propinas
    let propinas = [0, 5, 10, 15, 20]
    @State private var propina = 5
    
    // alert pago realizado
    @State private var showingPaymentAlert = false
    
    //Precio total
    var totalPrecio: String{
        let total = Double(order.total)
        let totalPropina = total/100 * Double(propina)
        return (total + totalPropina).formatted(.currency(code: "EUR")) // USD
    }
    
    var body: some View {
        
        Form{
            
            Section{
                Picker("Forma de pago", selection: $paymentType){
                    
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                    
                }
                
            }
            
            Section{
                Toggle("Tengo un cupon de descuento", isOn: $addCuponDetails)
                
                if addCuponDetails == true{
                    TextField("Introducir el cupon", text: $cuponCode)
                }
                
            }
            
            Section("Dejar propina"){
                Picker("Porcentaje de propina", selection: $propina){
                    
                    ForEach(propinas, id: \.self){
                        Text("\($0)")
                    }
                    
                }
                .pickerStyle(.segmented)
                
            }
            
            Section("Total: \(totalPrecio)"){
                Button("Confirmar Pedido"){
                    showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Finalizar compra")
        .navigationBarTitleDisplayMode(.inline)
        
        //Alert
        
        .alert("Pedido confirmado", isPresented: $showingPaymentAlert){
            //Buttons
        }message: {
            Text("El importe total del pedido es de \(totalPrecio), gracias")
        }
        
    }
}

#Preview {
    NavigationStack{
        CheckoutVista()
            .environmentObject(OrderModel())
    }
}
