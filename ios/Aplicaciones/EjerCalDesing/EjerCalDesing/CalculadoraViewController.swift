//
//  CalculadoraViewController.swift
//  EjerCalDesing
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    //Variables de los botones numericos
    @IBOutlet weak var boton0: UIButton!
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var boton2: UIButton!
    @IBOutlet weak var boton3: UIButton!
    @IBOutlet weak var boton4: UIButton!
    @IBOutlet weak var boton5: UIButton!
    @IBOutlet weak var boton6: UIButton!
    @IBOutlet weak var boton7: UIButton!
    @IBOutlet weak var boton8: UIButton!
    @IBOutlet weak var boton9: UIButton!
    
    // Label
    @IBOutlet weak var resultadoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func operaciones(_ sender: Any) {
        
        
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
