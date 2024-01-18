//
//  ViewController.swift
//  abrirAplicaciones
//
//  Created by dam2 on 17/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imagen: UIImageView!
    
    
    
    
    @IBAction func compartirAction(_ sender: Any) {
        
        let texto = "Bajate la aplicacion"
        
        if let siteUrl = URL(string: "https://escuelaestech.es"){
            
            let imagen = UIImage(named: "Image")!
            
            let objetosAcompartir: [Any] = [texto, siteUrl, imagen]
            
            let activityVC = UIActivityViewController(activityItems: objetosAcompartir, applicationActivities: nil)
            
            
            activityVC.popoverPresentationController?.sourceView = sender as? UIView
            self.present(activityVC, animated: true)
        }
    }
    
    
    @IBAction func estechBtn(_ sender: Any) {
        
        let urlString = "https://escuelaestech.es"
        
        if let url = URL(string: urlString){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func mapasAction(_ sender: Any) {
        
        let lat = 38.094160
        let lng = -3.63424
        
        let url = URL(string: "maps://?saddr=&daddr=\(lat),\(lng)&directionsmode=driving")!
        
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Definir el gesture reconicer
        
        let tap = UIPinchGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        
        //tap.numberOfTapsRequired = 3
        self.imagen.isUserInteractionEnabled = true
        self.imagen.addGestureRecognizer(tap)
    
    
    }
    
    @objc func handleTap(_ sender: UIPinchGestureRecognizer? = nil){
        print("Como te gusta tocarme")
    }


}

