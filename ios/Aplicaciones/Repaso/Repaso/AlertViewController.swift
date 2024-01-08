//
//  AlertViewController.swift
//  Repaso
//
//  Created by dam2 on 14/12/23.
//

import UIKit

class AlertViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        personajes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! MiCeldaCollectionViewCell
        
        cell.labelCelda.text = personajes[indexPath.item].character
    
        let imageURl = URL(string: personajes[indexPath.item].image)
        
        
        
//        if let data = try? Data(contentsOf: imageURl!){
//            cell.imgPersonaje.image = UIImage(data: data)
//        }

        let dataTask = URLSession.shared.dataTask(with: imageURl!){ (data, _, _) in
            if let data = data {
                
                DispatchQueue.main.async {
                    cell.imgPersonaje.image = UIImage(data: data)
                }
                
                
            }
        }
        dataTask.resume()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screamWidth = collectionView.frame.width
        var celdaWidth = 0
        
        if screamWidth > 700 {
            celdaWidth = Int(screamWidth/5 - 12)
        }else{
            celdaWidth = Int(screamWidth/2 - 8)
        }
            
        return CGSize(width: celdaWidth, height: celdaWidth)
    }
    
    // Esta funcion es para cuando pulsar la celda
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("has tocado el boton \(indexPath.item)")
        
        let ac = UIAlertController(title: personajes[indexPath.item].character, message: personajes[indexPath.item].quote, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) )
        self.present(ac, animated: true)
    }
    
    // Esta celda es para cuando sueltes la celda
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Has solsado el boton \(indexPath.item)")
        

        
    }
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var personajes: [PersonajeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        downloadData()
    }
    
    
    
    func downloadData(){
        
        let urlString = "https://qastusoft.com.es/apis/futurama_quotes.php"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            
            if let response = response as? HTTPURLResponse{
                print(response)
            }
            
            guard let data = data else {return}
            
            let personajes = try? JSONDecoder().decode([PersonajeModel].self, from: data)
            
            //print(personajes)
            
            if personajes != nil{
                self.personajes = personajes!
                
                DispatchQueue.main.async {
                    // Para que recargue el collection view
                    self.collectionView.reloadData()
                }
              
    
            }else{
                print("se ha producido un error")
            }
            
        }.resume()
        
        
    }
    


    @IBAction func buttonAction(_ sender: Any) {
        
//        let alertController: UIAlertController = UIAlertController(title: "Error", message: "seleccionar una opcion", preferredStyle: .alert) // o tipo .actionSheet
//        
//        //let aceptarAction: UIAlertAction = UIAlertAction(title: "Aceptar", style: .default)
//        let cancelarAction: UIAlertAction = UIAlertAction(title: "cancelar", style: .cancel)
//        let deleteAction: UIAlertAction = UIAlertAction(title: "Eliminar", style: .destructive)
//        
//        // ---------------------------------------------------------------------------------//
//        
//        // Le damos funcionalidad al boton
//        let aceptarAction: UIAlertAction = UIAlertAction(title: "Aceptar", style: .default, handler: {(action) -> Void in
//            
//            // Sacamos los valores de los textField para poder trabajar con ellos
//            guard let textFields = alertController.textFields else{return}
//            
//            if let username = textFields[0].text,
//               let password = textFields[1].text{
//                print("nombre: \(username) contraseña: \(password)")
//            }
//                
//        })
//        
//        
//        // ---------------------------------------------------------------------------------//
//        
//        // Le ponemos un textField
//        alertController.addTextField{ (textField) in
//            textField.placeholder = "Nombre del usuario"
//        }
//        
//        alertController.addTextField{ (textField) in
//            textField.placeholder = "Contraseña"
//            textField.isSecureTextEntry = true
//        }
//        
//        
//        alertController.addAction(aceptarAction)
//        alertController.addAction(cancelarAction)
//        alertController.addAction(deleteAction)
//        
//        self.present(alertController, animated: true)
//        
//        
//        
    }
    
}
