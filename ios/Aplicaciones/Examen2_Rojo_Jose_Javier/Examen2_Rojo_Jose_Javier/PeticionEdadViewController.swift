//
//  PeticionEdadViewController.swift
//  Examen2_Rojo_Jose_Javier
//
//  Created by dam2 on 13/12/23.
//

import UIKit

class PeticionEdadViewController: UIViewController {
    
    @IBOutlet weak var textFieldUsuario: UITextField!
    
    @IBOutlet weak var labelInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func enviar(_ sender: Any) {
        
        if (textFieldUsuario.text != ""){
            hacerPeticion()
            labelInfo.text = "Nombre Introducido"
        }else{
            labelInfo.text = "Este campo no puede estar vacio"
        }
        
 
    }
    
    
    func hacerPeticion(){
        
        var nombreUser = textFieldUsuario.text
        
        let url = String(format: "https://agify.io/?")
        
        guard let serviceUrl = URL(string: url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type: application/json; charset=utf-8")

        let bodyData = "name=\(nombreUser ?? "jose")"
        request.httpBody = bodyData.data(using: String.Encoding.utf8);

        URLSession.shared.dataTask(with: request){ (data, response, error) in
        
        if let data = data {
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                    
                if let jsonDatos = json as? [String: Any] {
        
                    let name = jsonDatos["name"] as? String
                    let age = jsonDatos["age"] as? String
                    print("nombre es \(name) y la edad es \(age)")
                    
                    //DispatchQueue.main.async{}
                    
                    }
                } catch {
                    //print(error)
                    print("Hubo un error")
                }
            }
            
        }.resume()
        
        
    }
    

}
