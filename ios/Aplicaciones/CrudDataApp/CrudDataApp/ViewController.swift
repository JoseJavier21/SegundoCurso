//
//  ViewController.swift
//  CrudDataApp
//
//  Created by dam2 on 24/1/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!

    var names = [String]()
    var people = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Listado de nombre"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //Recuperar las personas de CoreData
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fechRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try manageContext.fetch(fechRequest)
        }catch let error as NSError {
            print("No se ha podido ejecutar fecth. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addNameBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Nuevo Nombre", message: "Añade un nombre", preferredStyle: .alert)
                
            let saverAction = UIAlertAction(title: "Añadir", style: .default) { (action) -> Void in
                    
                guard let texField = alert.textFields?.first,
                    let nameToSave = texField.text else {
                    return
                }
                    
                //self.names.append(nameToSave)
                self.save(name: nameToSave)
                self.tableView.reloadData()
            }
                
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
                
            alert.addTextField()
            alert.addAction(saverAction)
            alert.addAction(cancelAction)
                
            present(alert, animated: true)
    }
    
    
    func save(name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: manageContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: manageContext)
        
        person.setValue(name, forKeyPath: "name")
        
        do {
            try manageContext.save()
            people.append(person)
        }catch let error as NSError {
            print("No se ha podido guardar. \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
    
}



extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.textLabel?.text = names[indexPath.row]
        
        let person = people[indexPath.row]
        
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Editar un elemento
        
        let editAction = UIContextualAction(style: .normal, title: "Editar"){(action, view, completionHandler) in

        //Obtener la instancia correspondiente a la celda
        let person = self.people[indexPath.row]
        
        
        //Llamamos a la funcion para editar el registro
        self.alertEditar(person: person)
        }
        
        //Eliminar
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar"){ (action, view, completionHandler) in
            
            let person = self.people[indexPath.row]
            
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
            self.people.remove(at: indexPath.row)
            
            //Recargamos la tabla
            tableView.reloadData()
        }
        
        editAction.backgroundColor = .black
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [editAction, deleteAction])
    }
    
    
    func alertEditar(person: NSManagedObject){
        let alert = UIAlertController(title: "Actualizar Nombre", message: "Añade un nuevo nombre", preferredStyle: .alert)
                
            let saverAction = UIAlertAction(title: "Actualizar", style: .default) { (action) -> Void in
                    
                guard let texField = alert.textFields?.first,
                    let nameToSave = texField.text else {
                    return
                }
                //Actualizamos el name de person
                person.setValue(nameToSave, forKey: "name")
                
                //Guardamos en CoreData
                do {
                    try person.managedObjectContext?.save()
                } catch let error as NSError{
                    print("Se ha producido un error. \(error), \(error.userInfo)")
                }
                
                //Recargamos la tabla
                self.tableView.reloadData()
            }
                
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
                
            alert.addTextField()
            alert.addAction(saverAction)
            alert.addAction(cancelAction)
                
            present(alert, animated: true)
    }
}

