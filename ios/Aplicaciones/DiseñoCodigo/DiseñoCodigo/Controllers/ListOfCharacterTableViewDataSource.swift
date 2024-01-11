//
//  ListOfCharacterTableViewDataSource.swift
//  DiseñoCodigo
//
//  Created by dam2 on 11/1/24.
//

import Foundation
import UIKit

final class ListOfCharacterTableViewDataSource: NSObject, UITableViewDataSource{

    private let tableView: UITableView
    
    private(set) var characters: [CharacterModel] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let celda = tableView.dequeueReusableCell(withIdentifier: "characterListCellView", for: indexPath) as! CharacterListViewCell
        let character = characters[indexPath.row]
        
        //celda.backgroundColor = .green
        celda.configure(character)
        return celda
    }
    
    func set(character: [CharacterModel]){
        self.characters = character
    }
    
    
    

}
