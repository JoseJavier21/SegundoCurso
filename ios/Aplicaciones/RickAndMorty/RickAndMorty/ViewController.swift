//
//  ViewController.swift
//  RickAndMorty
//
//  Created by dam2 on 14/12/23.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var personajes: [PersonajeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        peticionApi()
    }
    
    // Te da el numero de celda que se van a visualizar
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        personajes.count
    }
    
    
    // Da el formato de la propia celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "MiCelda", for: indexPath) as! MiCeldaCollectionViewCell
        
        // Ponemos el nombre y la especie a los label que hemos puesto en la celda
        celda.nombre.text = personajes[indexPath.item].name
        celda.especie.text = personajes[indexPath.item].species
                
        
        let imgUrl = URL(string: personajes[indexPath.item].image)
        
        // Por si las imagenes son muy pesadas o para que carga mas rapido hacemos que lo hagan en el mismo hilo
        let dataTask = URLSession.shared.dataTask(with: imgUrl!){ (data, _, _) in
            if let data = data{
                DispatchQueue.main.async {
                    celda.imagen.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
        return celda
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWith = collectionView.frame.width
    
        var celdaWith = 0
        
        if screenWith > 400 {
            celdaWith = Int (screenWith/5 - 10)
        }else {
            celdaWith = Int( screenWith/2 - 8)
        }
        
        return CGSize(width: celdaWith, height: celdaWith)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        //Instanciamos el Storyboard
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        //Instanciamos el ViewController
        let ViewDestination = storyBoard.instantiateViewController(withIdentifier: "infoPersonaje") as! InfoChartacterViewController
        
        ViewDestination.idPersonaje = personajes[indexPath.item].id
        
        ViewDestination.infoPersonaje = personajes[indexPath.item]
        
        
        //Presentamos el nuevo ViewController
        self.present(ViewDestination, animated: true)
    }
    
    
    
    
    
    func peticionApi(){
        
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            _ = try? JSONDecoder().decode([PersonajeModel].self, from: data)
            
  
            do{
                let respuesta = try JSONDecoder().decode(Respuesta.self, from: data)
                self.personajes = respuesta.results
                
            }catch{
                print("No funciona", error)
            }
            
            
        }.resume()
    }
    



}

