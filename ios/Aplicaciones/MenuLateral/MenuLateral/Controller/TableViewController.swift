//
//  TableViewController.swift
//  MenuLateral
//
//  Created by dam2 on 26/1/24.
//

import UIKit

class TableViewController: UITableViewController {

      
    
    @IBAction func openPantalla1(_ sender: Any) {
        
        
        navigationController?.show(PantallaUnoViewController(), sender: nil)
        
    }
    
    
    @IBAction func openPantalla2(_ sender: Any) {
        
        navigationController?.show(PantallaDosViewController(), sender: nil)
    }
    
}
