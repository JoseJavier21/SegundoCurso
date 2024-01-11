//
//  ViewController.swift
//  DisenioCodigo
//
//  Created by dam2 on 11/1/24.
//

import UIKit

class ViewController: UIViewController {

    // Propiedad que contiene el UITableView
    var mainView: ChartacterListView { self.view as! ChartacterListView }
    var apiClient = ListOfCharacterApiCLient()
    
    private var tableViewDataSource: ListOfCharacterTableViewDataSource?
    private var tableViewDelegate: ListOfCharacterTableViewDelegate?
    
    override func loadView() {
        view = ChartacterListView()
        
        tableViewDataSource = ListOfCharacterTableViewDataSource(tableView: mainView.characterTableView)
    
        mainView.characterTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = ListOfCharacterTableViewDelegate()
        
        mainView.characterTableView.delegate = tableViewDelegate
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Personajes"
        
        Task{
            let characters = await apiClient.getListCharacter().results
            //print("Characters \(characters)")
            tableViewDataSource?.set(character: characters)
        }
        
        // obtenemos el indice de la celda pulsado y el modelo correspondiente a partir del array del datasource. Despues presentamos el CharacterDetailViewController.
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            //presentamos al CharacterDetailController
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = dataSource.characters[index]
            
            let vc = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(vc, animated: true)
            
        }
    }
}

