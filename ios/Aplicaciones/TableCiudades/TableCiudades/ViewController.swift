//
//  ViewController.swift
//  TableCiudades
//
//  Created by dam2 on 5/12/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

   

    @IBOutlet weak var tabla: UITableView!
    
    
    let cityList = ["Linares", "Granada", "Málaga", "Madrid", "Barcelona"]
    
    var filterCities = [String]()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad(){
    super.viewDidLoad()
        
        tabla.delegate = self
        tabla.dataSource = self
        
        searchController.searchResultsUpdater = self // Informa a la clase de cambios en el UIsearchBar
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar Ciudad"
        
        //añadir el searchBar al navigationItem
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    

    
    func filterContentForSearchText(_ searchText: String){
        filterCities.removeAll()
        filterCities = cityList.filter{ (city: String) -> Bool in
            if city.lowercased().localizedCaseInsensitiveContains(self.searchController.searchBar.text!){
                return true
            }else{
                return false
            }
            }
            tabla.reloadData() // para recargar la tabla
        
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            if isFiltering{
                return filterCities.count
            }else{
                return cityList.count
            }
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let celda = tableView.dequeueReusableCell(withIdentifier: "celda_ciudad", for: indexPath) as! MiCeldaTableViewCell
            
            if isFiltering{
                celda.imagen.image = UIImage(named: filterCities[indexPath.row])
                celda.nombre.text = filterCities[indexPath.row]
            }else{
                celda.imagen.image = UIImage(named: cityList[indexPath.row])
                celda.nombre.text = cityList[indexPath.row]
            }
            
            return celda
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            200
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if isFiltering{
                print(filterCities[indexPath.row])
            }else{
                print(cityList[indexPath.row])
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "segundoVC") as! SegundoViewController
                
                vc.ciudadNombre = isFiltering ? filterCities[indexPath.row] : cityList[indexPath.row]
                
                self.navigationController?.show(vc, sender: nil)
            }
        }
    

}

extension ViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

