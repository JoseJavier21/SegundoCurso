//
//  ViewController.swift
//  tecladoControl
//
//  Created by dam2 on 10/1/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureKeyBoard()
        
        // si no se hace por la vista, por cada textfield que haya
        //self.nombredelTexfiled.delegate = .self,
        
        // O recorriendolo en vez de ir uno a uno
//        for tf in view.textFieldInView{
//            tf.delegate.self
//        }
        
    }
    
    // Para cuando se le da al intro se pase al siguiente input, cuando llegue al ultimo se cerrara, tambien se ajusta la pantalla por lo hecho anteriormente hecho
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }

    // Esta funcion es para que se pueda ocultar el teclado ya que por si solo no lo hace
    func configureKeyBoard(){
        
        keyboardWhenTapeAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
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
    
    
    @objc func keyBoardWillHide(notification: NSNotification){
        print("El teclado se va a ocultar")
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    
}

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

extension UIViewController{
    

    
    func keyboardWhenTapeAround(){
        // Aqui es donde la da la funcionalidad
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // Esta es la funcion para que cuando pulse fuera se vaya
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}


