//
//  ViewController.swift
//  NuevoTable
//
//  Created by dam2 on 20/12/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var datos = ["Felipe", "Eduardo", "Alberto", "Julio", "Benito"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = datos[indexPath.row]
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.count
    }
    
    // para limitar que moviles pueden usar las fuciones - desde que version puede ejecutar la funcion
    @available(iOS 11.0 , *)
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favouritesAction = UIContextualAction(style: .normal, title: "favoritos"){ [weak self] (action, view, completionHadler) in
            
            self?.manejarFavoritos(indexPath.row)
            print("hola que tal")
            completionHadler(true)
        }
        favouritesAction.backgroundColor = .blue
        favouritesAction.image = UIImage(systemName: "star")
        //UIImage(named: "nombre que este en los asset")
        
        // Otra funcion diferente
        let delete = UIContextualAction(style: .destructive, title: "delete"){
            [weak self] (action, view, completionHadler) in
            print("elimiado")
            //completionHadler(true)
        }
        delete.backgroundColor = .red
        
    
        return UISwipeActionsConfiguration(actions: [favouritesAction, delete])
    
    }

    
    func manejarFavoritos(_ indexPath: Int){
        print(datos[indexPath])
    }

    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    
        
    
    // funciona antiguas a las anteriores
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.row == 0{
//            return .none
//            
//        }else if indexPath.row == 1{
//            return .insert
//        }else{
//            return .delete
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            //eliminar el elemeneto del array
//            datos.remove(at: indexPath.row)
//            //eliminar la celda
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            
//        }else if editingStyle == .insert{
//            // crear la celda
//        }
//    }
}

