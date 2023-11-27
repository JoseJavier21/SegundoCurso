//
//  CalculadoraViewController.swift
//  EjerCalDesing
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class CalculadoraViewController: UIViewController {
    

    // Variables de la operaciones
    @IBOutlet weak var borrarUno: UIButton!
    @IBOutlet weak var resta: UIButton!
    @IBOutlet weak var suma: UIButton!
    @IBOutlet weak var multi: UIButton!
    @IBOutlet weak var divi: UIButton!
    @IBOutlet weak var porce: UIButton!
    @IBOutlet weak var parentesis: UIButton!
    @IBOutlet weak var borrarTodo: UIButton!
    
    
    // Label
    @IBOutlet weak var resultadoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func operaciones(_ sender: UIButton) {
        
        let botones = sender.titleLabel?.text?.lowercased()
        //var textoLabel = resultadoLabel.text!
        
        if botones == "AC"{
            resultadoLabel.text = ""
        }else if resultadoLabel.text != ""{
            resultadoLabel.text = (resultadoLabel.text!) + botones!
        }else{
            resultadoLabel.text = botones!
        }
        
        switch botones{
        case "AC": resultadoLabel.text = ""
        //case "0": resultadoLabel.text = botones
            
        default: resultadoLabel.text = "error"
        }
        
        
    }
    

}
