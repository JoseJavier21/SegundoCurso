//
//  InfoChartacterViewController.swift
//  RickAndMorty
//
//  Created by dam2 on 18/12/23.
//

import UIKit

class InfoChartacterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    
    var idPersonaje: Int!
    
    var infoPersonaje: PersonajeModel!
    
    
    @IBOutlet weak var constainsaltoTable: NSLayoutConstraint!
    // Datos del Personaje
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var especie: UILabel!
    @IBOutlet weak var genero: UILabel!
    @IBOutlet weak var estado: UILabel!
    @IBOutlet weak var origen: UILabel!
    @IBOutlet weak var localizacion: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var tabla: UITableView!
    
    var personajes: [PersonajeModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.dataSource = self
        tabla.delegate = self
        peticionApi()
        constainsaltoTable.constant = CGFloat(infoPersonaje.episode.count * 44)
    }
    

    
    func peticionApi(){
        
        //print(idPersonaje!)
        //print(infoPersonaje)
        let urlString = "https://rickandmortyapi.com/api/character"
        
        
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url){ [self] (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            
            _ = try? JSONDecoder().decode([PersonajeModel].self, from: data)
  
            do{
                let respuesta = try JSONDecoder().decode(Respuesta.self, from: data)
                self.personajes = respuesta.results
                //print(respuesta)
                
                //print(infoPersonaje)
                print(infoPersonaje.episode)
            
                DispatchQueue.main.async{ [self] in
                    
                        
                    nombre.text = infoPersonaje.name
                    especie.text = infoPersonaje.species
                    genero.text = infoPersonaje.gender
                    estado.text = infoPersonaje.status
                    origen.text = infoPersonaje.origin.name
                    localizacion.text = infoPersonaje.location.name
                    let imgUrl = URL(string: infoPersonaje.image)
                        
                        // Por si las imagenes son muy pesadas o para que carga mas rapido hacemos que lo hagan en el mismo hilo
                    let dataTask = URLSession.shared.dataTask(with: imgUrl!){ (data, _, _) in
                        if let data = data{
                            DispatchQueue.main.async {
                                    self.imagen.image = UIImage(data: data)
                            }
                        }
                    }
                    dataTask.resume()
                        
                    
                    
                }
 
            }catch{
                print("No funciona", error)
            }
            
//            if personajes != nil {
//                self.personajes = personajes
//                DispatchQueue.main.async{
//                   
//                }
//            }else {
//                print("Se ha producido un error en los datos")
//            }
            
        }.resume()
    }
    
    
    // CODIGO PARA LOS DATOS DE LA TABLA - QUE MUESTRE LOS EISODIOS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(infoPersonaje.episode.count)
        return infoPersonaje.episode.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda =  tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = infoPersonaje.episode[indexPath.row]
        return celda
    }

}
