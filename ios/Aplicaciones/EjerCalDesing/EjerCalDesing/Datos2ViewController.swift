//
//  Datos2ViewController.swift
//  EjerCalDesing
//
//  Created by dam2 on 23/11/23.
//

import UIKit

protocol DatosLabelDelegate{
    func userDidEnterInformation(datosLabel: String)
}

class Datos2ViewController: UIViewController {
    
    @IBOutlet weak var labelNombre: UILabel!
    var nombre = ""
    
    var delegate: DatosLabelDelegate?
    

    @IBOutlet weak var textfieldDos: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelNombre.text = nombre
    }
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//        delegate?.userDidEnterInformation(datosLabel: textfieldDos.text ?? "")
//    }
//    
    
    @IBAction func cerrarController(_ sender: Any) {
        delegate?.userDidEnterInformation(datosLabel: textfieldDos.text ?? "")
        self.dismiss(animated: true) // quitar la vista
        
        self.navigationController?.popViewController(animated: true)// para quitar la ultima vista del navigation controller
    }
}
