//
//  ViewController.swift
//  comunicacionExterior
//
//  Created by dam2 on 27/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        downloadData()
        //downloadPost()
    }
    
    
    func downloadData(){
        
        let urlString = "https://rickandmortyapi.com/api/character"// la url en string pero asi no nos vale
        guard let url = URL(string: urlString) else { return }// la pasamos a tipo url para poder usarla
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            
            if error != nil{
                print(error!.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse{
                //print(response)
                print("Response Code: \(response.statusCode)")
            }
            
            guard let data = data else {return}
            
            //let str = String(decoding: data, as: UTF8.self)
            //print(str)
            
            do{
                //let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                //print(json["name"] as! String)
                //let array = json["results"] as! [[String: Any]]
                //for pj in array{
                //    print(pj["name"] ?? "")
                //}
                let json = try JSONDecoder().decode(CharacterModelResponse.self, from: data)
                for pj in json.results{
                    print(pj.name)
                }
                
                print("bye")
                
            }catch let jsonError{
                print(jsonError)
            }
            
        }.resume()
        
        print("Se ha lanzado la peticion")
    }
    
    
    func downloadPost(){
        let urlString = "https://qastusoft.com.es/apis/frase.php" // la url en string pero asi no nos vale
        guard let url = URL(string: urlString) else { return } // la pasamos a tipo url para poder usarla
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
        
        let bodyData = "centro=estech&anio=2023"
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
                
            if error != nil{
                print(error!.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse{
                //print(response)
                print("Response Code: \(response.statusCode)")
            }
            
            guard let data = data else {return}
            
            //let str = String(decoding: data, as: UTF8.self)
            //print(str)
            
            do{
                let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                print(json["name"] as! String)
                print("bye")
                
            }catch let jsonError{
                print(jsonError)
            }
            
            
        }.resume()
        
    }
    
    
}

