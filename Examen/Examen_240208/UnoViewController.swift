import UIKit

class UnoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var imgage: UIImageView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        
        tapGesture.delegate = self
        tapGesture1.delegate = self
        tapGesture2.delegate = self
        tapGesture3.delegate = self
        
        imgage.addGestureRecognizer(tapGesture)
        image1.addGestureRecognizer(tapGesture1)
        image2.addGestureRecognizer(tapGesture2)
        image3.addGestureRecognizer(tapGesture3)
        
        imgage.isUserInteractionEnabled = true
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
    }

    // Función que se ejecutará cuando se toque la imagen
    @objc func imageTapped(_ sender: UITapGestureRecognizer){
        guardarfotos(imagen: sender.view as! UIImageView)
    }
    
    func guardarfotos(imagen: UIImageView) {
        
        UIImageWriteToSavedPhotosAlbum(imagen.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Error al guardar", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Imagen Guardada", message: "La imagen se ha guardado satisfactoriamente", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}
