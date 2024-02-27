import UIKit

class UnoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var imgage: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configurar el gesto para detectar el toque en la imagen
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        
        tapGesture.delegate = self
        imgage.addGestureRecognizer(tapGesture)
        image1.addGestureRecognizer(tapGesture)
        image2.addGestureRecognizer(tapGesture)
        image3.addGestureRecognizer(tapGesture)
        
        imgage.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true

    }

    // Función que se ejecutará cuando se toque la imagen
    @objc func imageTapped(_ sender: UITapGestureRecognizer){
        guardarfotos()
    }
    
    func guardarfotos() {
        
        UIImageWriteToSavedPhotosAlbum(imgage.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)

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
