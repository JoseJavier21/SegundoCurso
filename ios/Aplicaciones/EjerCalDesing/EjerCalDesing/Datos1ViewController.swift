//
//  Datos1ViewController.swift
//  EjerCalDesing
//
//  Created by dam2 on 23/11/23.
//

import UIKit

class Datos1ViewController: UIViewController, DatosLabelDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var labelUno: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func botonAzul(_ sender: Any) {
        
        if textField.text != ""{
            // Instanciamos Storyboard
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            // Instanciamos el ViewController
            let vc = storyBoard.instantiateViewController(withIdentifier: "viewControllerDos") as! Datos2ViewController
            
            vc.nombre = textField.text ?? ""
            
            //Presentar el nuevo ViewController como independiente
            //self.present(vc, animated: true)
            
            // Establecemos el delegate en ViewControllerDos
            vc.delegate = self
            
            vc.modalPresentationStyle = .fullScreen
            
            //Presentar el nuevo ViewController dentro del Navigation Controller
            //  self.navigationController?.pushViewController(vc, animated: true)
        }

    }
    

    func userDidEnterInformation(datosLabel: String) {
        
        labelUno.text == datosLabel
        
    }
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "llevarAView" {
            let vc = segue.destination as! Datos2ViewController
            vc.nombre = textField.text ?? ""
        }
    }
    

}
