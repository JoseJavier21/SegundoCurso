//
//  LoginViewController.swift
//  LoginDatos
//
//  Created by dam2 on 4/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var labelRespuesta: UILabel!
    
    let nombre: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    
    
    @IBAction func botonLogin(_ sender: Any) {
        
        let contra = username.text! + "."
        
        if contra.count >= 6 {
            envioDatos(user: username.text!, pass: contra)
        }else{
            labelRespuesta.text = "contraseña corta"
        }
    }
    
    
    
    
    func envioDatos(user: String, pass: String){
        let urlSession = URLSession.shared
        let url = URL(string: "https://qastusoft.com.es/apis/login.php?user=\(user)&&pass=\(pass)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
        
        let bodyData = "user=\(user)&pass=\(pass)"
        
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        urlSession.dataTask(with: url!){ data, response, error in
            
            if let data = data{
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                //print(String(describing: json!))
                
                DispatchQueue.main.async {
                    
                    let codigo = json!["code"] as! Int
                    print(codigo.description)
                    
                    switch codigo{
                    case 1:
                        self.labelRespuesta.text = "Login Correcto"
                        cambiarPantalla()
                    case -1:
                        self.labelRespuesta.text = "Faltan datos"
                    case -2:
                        self.labelRespuesta.text = "datos incorrectos"
                    default:
                        return self.labelRespuesta.text = "error"
                    }
                }
            }
        }.resume()
        
        func cambiarPantalla(){
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let pantalla2 = storyBoard.instantiateViewController(identifier: "pantalla2Controller") as! Pantalla2ViewController
            pantalla2.nombre = username.text ?? ""
            pantalla2.modalPresentationStyle = .fullScreen
            self.navigationController?.show(pantalla2, sender: nil)
            
        }
        
    }
    
}
