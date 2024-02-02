//
//  SideMenu.swift
//  MenuLateral
//
//  Created by dam2 on 24/1/24.
//

import Foundation
import UIKit

protocol MenuControllerDelegate{
    func didSelectMenuItem(name: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable{
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
}

class MenuController: UITableViewController{
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItem:[SideMenuItem]
    
    init(with menuItem: [SideMenuItem]){
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "celda")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // Funciones de la Tabla
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = menuItem[indexPath.row].rawValue
        //celda.textLabel?.textColor = .white
        return celda
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItem[indexPath.row]
        delegate?.didSelectMenuItem(name: selectedItem)
        
    }
}

