//
//  ViewController.swift
//  DiseñoCodigo
//
//  Created by dam2 on 11/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Propiedad que contiene el UITableView
    var mainView: ChartacterListView { self.view as! ChartacterListView }
    var apiClient = ListOfCharacterApiCLient()
    
    //private var tableViewDataSource: ListOfCharacterTableViewDataSource?
    
    override func loadView() {
        view = ChartacterListView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Personajes"
        
        Task{
            let characters = await apiClient.getListCharacter().results
            print("Characters \(characters)")
        }
    }


}

