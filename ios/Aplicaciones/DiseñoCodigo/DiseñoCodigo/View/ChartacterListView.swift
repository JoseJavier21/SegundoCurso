//
//  ChartacterListView.swift
//  DiseñoCodigo
//
//  Created by dam2 on 11/1/24.
//

import UIKit

class ChartacterListView: UIView {
    
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // registramos la celda en la tabla
        tableView.register(CharacterListViewCell.self, forCellReuseIdentifier: "characterListCellView")
        return tableView
        
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) no esta implementado")
    }
    
    func setupView(){
        addSubview(characterTableView)
        NSLayoutConstraint.activate([
            characterTableView.leadingAnchor.constraint(equalTo: leadingAnchor),                                     characterTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterTableView.topAnchor.constraint(equalTo: topAnchor),
            characterTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    

}
