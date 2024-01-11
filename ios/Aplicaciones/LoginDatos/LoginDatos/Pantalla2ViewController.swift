//
//  Pantalla2ViewController.swift
//  LoginDatos
//
//  Created by dam2 on 4/12/23.
//

import UIKit

class Pantalla2ViewController: UIViewController {

    @IBOutlet weak var saludoTexto: UILabel!
    
    var nombre: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //saludoTexto.text = "Buenas \(nombre)"
        
        downloadData()
    }
    
    func downloadData(){
        
        let urlString = "https://qastusoft.com.es/apis/login.php?user=Alberto&&contra=Alberto."
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ [self] (data, response, error) in
            
//            if let response = response as? HTTPURLResponse{
//                //print(response)
//                print("Response Code: \(response.statusCode)")
//            }
            
            guard let data = data else {return}
        

            do{
                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                print(json["data"] as! String)
                
                saludoTexto.text = "Buenas \(json.values)"
                
//                let array = json["data"] as! [[String: Any]]
//                for code in array{
//                    print(code["user"] ?? "algo")
//                }
                                
                
            }catch let jsonError{
                print(jsonError)
            }
            
        }.resume()
        
        
    }
    
    
    

}
