//
//  TresViewController.swift
//  Examen_240208
//
//  Created by estech on 27/2/24.
//

import UIKit
import CoreData

class TresViewController: UITableViewController {
    
    var gente = [NSManagedObject]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        importarGente()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    func importarGente(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fechRequest = NSFetchRequest<NSManagedObject>(entityName: "Persona")
        
        do {
            gente = try manageContext.fetch(fechRequest)
            tabBarItem.badgeValue = String(gente.count)
            tableView.reloadData()
        }catch let error as NSError {
            print("No se ha podido ejecutar fecth. \(error), \(error.userInfo)")
        }
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gente.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)
        
        let persona = gente[indexPath.row]
        let nombre = persona.value(forKey: "nombre") as? String
        let correo = persona.value(forKey: "correo") as? String
        let telefono = persona.value(forKey: "telefono") as? String
        
        cell.userActivity?.title = nombre
        
        cell.textLabel!.text = "Nombre: \(nombre!) - Telefono: \(telefono!) - Correo: \(correo!)"
 
        return cell
    }
    

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar"){ (action, view, completionHandler) in
            
            let person = self.gente[indexPath.row]
            
            //Eliminamos la instacion del CoreData
            let manageContext = person.managedObjectContext
            manageContext?.delete(person)
            
            //Guardamos los cambios en el contexto
            do {
                try manageContext?.save()
            }catch let error as NSError{
                print("No se ha podido eliminar. \(error), \(error.userInfo)")
            }
            
            //Eliminamos la instacion del array de people
            self.gente.remove(at: indexPath.row)
            
            //Recargamos la tabla
            tableView.reloadData()
        }
        
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    
    }


}
