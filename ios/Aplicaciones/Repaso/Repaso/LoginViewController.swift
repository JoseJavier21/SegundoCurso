//
//  LoginViewController.swift
//  Repaso
//
//  Created by dam2 on 12/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var contrasenia: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func hacerLogin(_ sender: Any) {
        
        enviarDatos()
    }
    
    
    func enviarDatos(){
        
        var usuario : String = user.text ?? ""
        var pass : String = contrasenia.text ?? ""
    
        
        let url = String(format: "https://qastusoft.com.es/apis/login.php?")
        
        guard let serviceUrl = URL(string: url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let bodyData = "user=\(usuario)&pass=\(pass)."
        request.httpBody = bodyData.data(using: String.Encoding.utf8);

        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            
        if let data = data {
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                    
                if let jsonDatos = json as? [String: Any] {
                        
                    let code = jsonDatos["code"] as? Int
                    let dataValue = jsonDatos["data"] as? String

                    
                    DispatchQueue.main.async {
                        
                        switch code {
                        case 1:
                            print("todo bien")
                        case -1:
                            print("no se pudo")
                        case 2:
                            print("datos mal puestos")
                        default:
                            print("otro error")
                        }
                        

                    }
                    
                    }
                } catch {
                    //print(error)
                    print("Hubo un error")
                }
            }
            
        }.resume()

    }
}


