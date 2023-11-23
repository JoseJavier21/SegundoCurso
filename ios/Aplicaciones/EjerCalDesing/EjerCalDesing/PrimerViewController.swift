//
//  PrimerViewController.swift
//  EjerCalDesing
//
//  Created by dam2 on 20/11/23.
//

import UIKit


class PrimerViewController: UIViewController {
    
    
    @IBOutlet weak var miLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var saludo: UILabel!
    @IBOutlet weak var miSwitch: UISwitch!
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var mislider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        miLabel.text = "Nombre de usuario"
        
        boton.setTitle("Saludar", for: .normal)
        
        mislider.minimumValue = 1
        mislider.maximumValue = 10
        
        
    }
    
    
    @IBAction func otroboton(_ sender: UISwitch) {
        print("Se ha tocado el switch")
        //let miSwitch = sender as! UISwitch
        
        if sender.isOn {
            print("Se ha encendido el switch")
            
            imagen.image = UIImage(named: "fondoJuegos")
            
        }else{
            print("Se ha apagado el switch")
            imagen.image = nil
            
        }
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        let sliderVal = mislider.value
        
        if let nombre = textField.text, nombre != ""{
            saludo.text = "Hola \(nombre), has seleccionado \(sliderVal)"
        }else{
            saludo.text = "No hay nadie"
        }
        
        
        }
    
    @IBOutlet weak var separacionSwitchConstrains: NSLayoutConstraint!
    
    @IBAction func switchAzul(_ sender: UISwitch) {
        
        if sender.isOn{
            separacionSwitchConstrains.constant = 40
            mislider.value = 5.0
        }else{
            separacionSwitchConstrains.constant = 18
        }
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
