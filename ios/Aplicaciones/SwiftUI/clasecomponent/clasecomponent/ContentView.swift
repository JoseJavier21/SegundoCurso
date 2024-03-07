//
//  ContentView.swift
//  clasecomponent
//
//  Created by dam2 on 21/2/24.
//

import SwiftUI


//struct SaludoView: View{
//    var saludo: String
//    var body: some View{
//        Text("holaa")
//    }
//}

class ViewModel: ObservableObject{
    @Published var username: String = ""
}

struct ContentView: View {
 
    @ObservedObject var viewModel = ViewModel()
    
    @State var texto = "alfonso"
    @State var conta = 0
    @State var fechaActual: Date = Date()
    @State var color: Color = .blue
    @State var isloading: Bool = false
    @State var progress: Float = 0.0
    @State var isOn: Bool = false
    
    var body: some View {
        
        HStack{
            Text("hola")
        }
        
        
//        Button("Púlsame"){
//            print("Boton pulsado \(texto)")
//        }
//        Text("Hola mundo")
//            .padding()
//            .contextMenu(ContextMenu(menuItems: {
//                Button("Efectivo"){
//                    print("item 1")
//                }
//                                    
//                Button("item 1"){
//                    print("item 1")
//                }
//            
//            }))

        
//        Form{
//            DatePicker("Select date", selection: $fechaActual, in: Date()..., displayedComponents: [.date,.hourAndMinute])
//            Text(fechaActual, style: .date)
//            
//            Section{
//                ColorPicker("Selecciona un color", selection: $color)
//                
//                Rectangle()
//                    .foregroundColor(color)
//                    .cornerRadius(5)
//            }
//            
//            Section{
//                
//                ProgressView(value: progress)
//                
//            }
//            
//            Section{
//                Toggle("Quiero recibir spam",isOn: $isOn)
//                    .tint(.black)
//                Text(isOn.description)
//            }
//            
//            Section{
//                //Stepper("Articulos", value: $conta, in: 1...10, step: 1)
//                Text("\(conta) articulo")
//                
//                Stepper("Nº Articulos"){
//                    //Incremento
//                    conta += 1
//                    print("Se ha añadido un articulo")
//                } onDecrement: {
//                    //Decrememto
//                    conta -= 1
//                    print("Se ha quitado un articulo")
//                }
//            
//            }
//            
//            Section{
//                
//                Slider(value: $progress, in: 0...10, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("10")){
//                    Text("Seleciona un numero")
//                }
//                Text("Valor del progeso \(progress)")
//                    .foregroundStyle(isOn ? .green : .red)
//                
//            }
//        }
//        
//
//        
//        if isloading {
//            ProgressView("cargando...")
//                .scaleEffect(1.5)
//                .padding(40)
//            
//        }
//        Button("Cargar"){
//            isloading.toggle()
//            progress += 0.5
            
        }
        
        
        //Link("Ir al sitio web", destination: URL(string: "https://www.pccomponentes.com/")!)
        //Link("Ir al sitio web", destination: URL(string: UIApplication.openSettingsURLString)!
        //Label: "Ajustes", systemImage: "gear")
        
        
        
        
//        VStack {
////            Label("Dedp like", systemImage: "hand.thumbsup.fill")
////                .font(.largeTitle)
////                .labelStyle(.iconOnly)
//            
////            Text("lorem ipsum texto de ejemplo que no tiene por que tener significa y es un texto ramdom que esta vez es uno creado pir uno.lorem ipsum texto de ejemplo que no tiene por que tener significa y es un texto ramdom que esta vez es uno creado pir uno.lorem ipsum texto de ejemplo que no tiene por que tener significa y es un texto ramdom que esta vez es uno creado pir uno.")
////                .font(.caption)
////                .underline()
////                .bold()
////                //.rotationEffect(.degrees(30))
////                .padding(.top, 10)
////                .rotation3DEffect(.degrees(10),
////                                  axis: (x: 20, y:0, z:0)
////                )
////                .shadow(color: .gray, radius: 2, x: 0, y: 10)
////                + Text("lorem ipsum texto de ejemplo que no tiene por que tener significa y es un texto ramdom que esta vez es uno creado pir uno.lorem ipsum texto de ejemplo que no tiene por que tener significa y es un texto ramdom que esta vez es uno creado pir uno.lorem ipsum texto de ejemplo que no tiene por que tener significa y es un texto ramdom que esta vez es uno creado pir uno.")
//            
////            Text(Date(), style: .date)
////            Text(Date(), style: .timer)
////            Text(Date(), style: .time)
////            Text(Date().addingTimeInterval(100), style: .timer)
////            
////            Button(action: {
////                print("hola es el boton de prubea")
////            }, label: {
////                Text("Es el label del boton")
////            })
////            
////            Button("Pulsa aqui"){
////                print("accion del boton de apulsa aqui")
////            }
//            
////            TextField("Nombre de la persona", text: .constant(""))
////                .keyboardType(.emailAddress)
////                .disableAutocorrection(true)
//                
//        
////            TextEditor(text: $texto)
////            .onChange(of: texto){
////                   conta = texto.count
////               }
////            
////            
////            Text("\(texto.count)")
////                .foregroundStyle(texto.count <= 50 ? .gray : .red)
////                .font(.largeTitle)
//            
//            @State var fechaActual: Date = Date()
//            
////            DatePicker("Select date",selection: $fechaActual)
////                .datePickerStyle(.wheel)
//            
//            DatePicker("Select date", selection: $fechaActual, in: Date()..., displayedComponents: [.date,.hourAndMinute])
//            
//            
//        }
//        .padding()
//    }
}

#Preview {
    ContentView()
}
