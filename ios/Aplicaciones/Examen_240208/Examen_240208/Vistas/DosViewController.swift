//
//  DosViewController.swift
//  Examen_240208
//
//  Created by Alfonso Marín on 7/2/24.
//

import UIKit
import CoreData

class DosViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailName: UILabel!
    @IBOutlet weak var phoneName: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    var gente = [NSManagedObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // funcion que llama a las demas funciones del teclado
        configureKeyBoard()
        
    }
    
    @IBAction func btnGuardar(_ sender: Any) {
        
        comprobacion()
        
    }
    
    
    
    
    func save(name: String, correo: String, telefono: String){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Persona", in: manageContext)!
        
        let persona = NSManagedObject(entity: entity, insertInto: manageContext)
        
        persona.setValue(name, forKey: "nombre")
        persona.setValue(correo, forKey: "correo")
        persona.setValue(telefono, forKey: "telefono")
        
        
        do {
            try manageContext.save()
            gente.append(persona)
        }catch let error as NSError {
            print("No se ha podido guardar. \(error), \(error.userInfo)")
        }
    }
    
    
    func comprobacion(){
        
        if nameField.text != "" ||  mailField.text != "" ||  phoneField.text != ""{
                    
            alert()
        }else{
            print("no se puede guardar")
        }
        
    }
    
    
    
    func alert(){
    
        let alert = UIAlertController(title: "Enviado", message: "Se han guardado los datos correctamente", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] (action) in
            
            save(name: nameField.text!, correo: mailField.text!, telefono: phoneField.text!)
            print("se guardara todo")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Se canceló el guardado")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    

    
    
    
    // funcion general por que la llamamos a las demas funciones de las funcionalidades del teclado
    func configureKeyBoard(){
        
        keyboardWhenTapeAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

    // Para que cuando se pulse  fuera del un textField
    func keyboardWhenTapeAround(){

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    // Para que muestre el teclado y ajuste la vista
    @objc func keyboardWillShow(notification: NSNotification){
        print("El teclado se va a mostrar")
        
        // Para saber el tamaño del teclado
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            
            // Se calcula donde se encuentra el input por el tamaño y el teclado
            if let seleccionado = view.selectedTextField {
                if seleccionado.frame.origin.y + seleccionado.frame.height > UIScreen.main.bounds.size.height - keyboardSize.height - 50 {
                    if self.view.frame.origin.y == 0{
                        self.view.frame.origin.y -= keyboardSize.height
                    }
                }
            }
        }
    }
    
    
    // Para que oculte el teclado
    @objc func keyBoardWillHide(notification: NSNotification){
        print("El teclado se va a ocultar")
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    
    
}

// Vista del textfield
extension UIView{
    
    var textFieldInView: [UITextField]{
        return subviews
            .filter({ !($0 is UITextField)})
            .reduce((subviews.compactMap{$0 as? UITextField}), { sumn , current in
                return sumn + current.textFieldInView})
    }
    
    var selectedTextField: UITextField?{
        return textFieldInView.filter{
            $0.isFirstResponder
        }.first
    }
}
