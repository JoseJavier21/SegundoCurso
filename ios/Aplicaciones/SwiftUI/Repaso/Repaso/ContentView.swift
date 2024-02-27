//
//  ContentView.swift
//  Repaso
//
//  Created by dam2 on 26/2/24.
//

import SwiftUI

final class ViewModel: ObservableObject{
    @Published var counter = 0
}


struct ContentView: View {
    
    @StateObject var viewmodel = ViewModel()
    
    var body: some View {
        VStack {
            Text("Contador: \(viewmodel.counter)")
              .font(.largeTitle)
              .bold()
            Text("Vista 1")
            //View2(viewModel: viewmodel)
            View2()
        }
        .padding()
        .foregroundStyle(.blue)
        .environmentObject(viewmodel)
    }

    
}


struct View2: View {
    
//    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            Text("Vista 2")
                .padding()
            //View3(viewModel: viewModel)
            View3()
        }
        .foregroundStyle(.red)
    }
}


struct View3: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            Text("Vista 3")
            Button("Pulsame"){
                viewModel.counter += 1
            }
        }
        .foregroundStyle(.green)
    }
}

#Preview {
    ContentView()
}


#Preview {
    //View2(viewModel: ViewModel())
    View2()
}


#Preview {
    //View3(viewModel: ViewModel())
    View3()
}
