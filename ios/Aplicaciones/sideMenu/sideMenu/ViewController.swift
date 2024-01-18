//
//  ViewController.swift
//  sideMenu
//
//  Created by dam2 on 15/1/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet weak var menuTableVIew: UITableView!
    
    
    var options: [option] = [
        option(title: "Home",
               segue: "HomeSegue"),
        option(title: "Setting",
              segue: "SettingSegue")
    ]
    
    
    struct option{
        var title = String()
        var segue = String()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableVIew.delegate = self
        menuTableVIew.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        
        cell.backgroundColor = .clear
        cell.descripcionLabel.text = options[indexPath.row].title
        cell.descripcionLabel.textColor = #colorLiteral(red: 0.5145893127, green: 1, blue: 0.9806485694, alpha: 1)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
            
            currentCell.alpha = 0.5
            UIView.animate(withDuration: 1){
                currentCell.alpha = 1
                }
            
            self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
        }
    }


}




class tableViewCell: UITableViewCell{
    

    @IBOutlet weak var descripcionLabel: UILabel!
    
}

