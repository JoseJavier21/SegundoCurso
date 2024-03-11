//
//  ContentView.swift
//  NotasSwiftUI
//
//  Created by dam2 on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var descriptionNote: String = "Crear una nota"
    @StateObject var notasViewModel = NotaViewModel()
    
    var body: some View {
    
        NavigationStack{
            
            VStack{
                    
                Text("Añade una nota")
                    .underline()
                    .foregroundStyle(.blue)
                
                TextEditor(text: $descriptionNote)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 1)
                    )
                    .padding([.leading, .trailing], 15)
                    .autocorrectionDisabled()
                
                Button("Crear una nota"){
                    notasViewModel.saveNote(description: descriptionNote) // guarda la nota
                    descriptionNote = ""
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .disabled(descriptionNote.isEmpty)
                Spacer()
                
                List{
                    ForEach($notasViewModel.notes, id: \.id){ $nota in
                        
                        HStack{
                            if nota.favourite{
                                Label(nota.descripcion, systemImage: "star.fill")
                                
                            }else{
                                Text(nota.descripcion)
                            }
                            
                        }
                        .swipeActions(edge: .trailing){
                            Button{
                                notasViewModel.updatefavouriteNote(note: $nota)
                            }label: {
                                Label("Favorito", systemImage: "star.fill")
                            }
                            .tint(.blue)
                            
                        }
                        .swipeActions(edge: .leading){
                            Button{
                                notasViewModel.removeNote(withId: nota.id)
                            }label: {
                                Label("Borrar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .navigationTitle("Notas")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                Text(notasViewModel.numberofNotes())
            }
            
            
            
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
