//
//  NotaViewModel.swift
//  NotasSwiftUI
//
//  Created by dam2 on 11/3/24.
//

import Foundation
import SwiftUI

final class NotaViewModel: ObservableObject{
    
    @Published var notes: [Model] = []
    
    private let userDefaults: UserDefaults = .standard
    
    init(){
        
        notes = getAllNotes()
    }
    
    // Se ejecuta la pular el boton y se guarda la nota
    func saveNote(description: String){
        
        //Creamos una instancia de la nota con la descripcion
        let newNote = Model(description: description)
        
        //insertamos la nota en el array
        notes.insert(newNote, at: 0)
        
        //Actualizamods el array en userDefault
        self.encodeSaveNotes()
    }
    
    func getAllNotes() -> [Model]{
        if let notasData = userDefaults.object(forKey: "notes") as? Data{
            if let notas = try? JSONDecoder().decode([Model].self, from: notasData){
                return notas
            }
        }
        return []
    }
        
        
        // Codifica las notas en json y las almacena en un UserDefaults
        
        private func encodeSaveNotes(){
            if let encoded = try? JSONEncoder().encode(notes){
                userDefaults.set(encoded, forKey: "notas")
            }
            
            
        }
    
    //Eliminamos una nota
    
    func removeNote(withId id: String){
        notes.removeAll(where: {$0.id == id})
        encodeSaveNotes()
    }
    
    
    //marcar o desmarcar nota como favotitos
    
    func updatefavouriteNote(note: Binding<Model>){
        note.wrappedValue.favourite = !note.wrappedValue.favourite
        note.wrappedValue.favourite.toggle()
        encodeSaveNotes()
    }
    
    //Devuelve el numero de notas que hay

    func numberofNotes() -> String{
        "\(notes.count)"
    }
}

