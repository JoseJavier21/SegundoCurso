//
//  SegundoViewController.swift
//  TableCiudades
//
//  Created by dam2 on 5/12/23.
//

import UIKit

class SegundoViewController: UIViewController {
    
    var ciudadNombre: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = ciudadNombre
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
