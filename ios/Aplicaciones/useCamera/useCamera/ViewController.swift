//
//  ViewController.swift
//  useCamera
//
//  Created by dam2 on 31/1/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imgeView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true)
        imgeView.image = info[.originalImage] as? UIImage
    }
    
    
    @IBAction func fotoAction(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.showsCameraControls = true
        imagePicker.cameraCaptureMode = UIImagePickerController.CameraCaptureMode.photo
        
        present(imagePicker, animated: true)
    }
    

    @IBAction func galeriaAction(_ sender: Any) {
        
//        imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = true
//        
//        present(imagePicker, animated: true)
        
        self.configurePHImagePicker()
    }
    
    func configurePHImagePicker(){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1 //0 = Ilimitado
        configuration.filter = .images
        let pickerViewController = PHPickerViewController(configuration: configuration)
        pickerViewController.delegate = self
        present(pickerViewController, animated: true)
        
    }
    
    
    @IBAction func guardarAction(_ sender: Any) {
            
        UIImageWriteToSavedPhotosAlbum(imgeView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        
        
        present(imagePicker, animated: true)
    }
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer){
            
        if let error = error{
            let ac = UIAlertController(title: "Error al guardar", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }else{
            let ac = UIAlertController(title: "Imagen Guardada", message: "La imagen se ha guardado satisfactiriamente", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    
}


extension ViewController: PHPickerViewControllerDelegate{
    
    func picker(_ picker: PHPikerViewContoller, didFinishPicking results: [PHPockerResults]){
        if let itemProvider = resuts.first?.itemProvider{
            itemProvider.loadObject(ofClass: UIImage.self){
                image, error in
                if let error{
                    print(error)
            }
                if let selectedImage = image as? UIImage{
                    DispatchQueue.main.async {
                        self.imageView.image = selectedImage
                    }
                }
        }
    }
}
