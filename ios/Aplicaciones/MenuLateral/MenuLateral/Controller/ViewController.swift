//
//  ViewController.swift
//  MenuLateral
//
//  Created by dam2 on 23/1/24.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    


    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the menu
        let menu = SideMenuNavigationController(rootViewController: ViewController())
        present(menu, animated: true, completion: nil)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        

    }
    

}


