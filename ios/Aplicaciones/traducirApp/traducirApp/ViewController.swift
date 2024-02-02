//
//  ViewController.swift
//  traducirApp
//
//  Created by dam2 on 25/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var buton1: UIButton!
        
    @IBOutlet weak var btnLang: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(["es_ES"], forKey: "AppleLanguages")
        
        self.setText()
    }
    
    func setText(){
        label1.text = NSLocalizedString("Bienvenida", tableName: "Localizable", comment: "hi")
        label2.text = NSLocalizedString("name", comment: "n")
        buton1.setTitle(NSLocalizedString("ok", comment: "btn"), for: .normal)
        btnLang.setTitle(NSLocalizedString("Lang", comment: "btn"), for: .normal)
    }

    
    @IBAction func LangSettings(_ sender: Any) {
        
        guard let settingsURl = URL(string: UIApplication.openSettingsURLString) else {return}
        
        UIApplication.shared.open(settingsURl, options: [:], completionHandler: nil)
    }
    
}

