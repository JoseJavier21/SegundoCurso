import UIKit

class CalculadoraViewController: UIViewController {

    @IBOutlet weak var resultadoLabel: UILabel!
    
    // No funcionan todos los botones, estan las operaciones basicas solo.
    // El diseño de la calculadora es la de mi movil, pensaba que podiamos usar otro diseño

    var primerNumero: Int = 0
    var segundoNumero: Int = 0
    var operador: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButNum(_ sender: UIButton) {
        let textoBoton: String = sender.titleLabel?.text ?? ""
        var textoLabel: String = resultadoLabel.text ?? "0"

        switch textoBoton {
        case "0"..."9":
            resultadoLabel.text = textoLabel + textoBoton
        default:
            textoLabel = "error"
        }
    }

    @IBAction func suma(_ sender: Any) {
        if resultadoLabel.text != "" {
            primerNumero = Int(resultadoLabel.text!)!
            operador = "+"
            resultadoLabel.text = "\(primerNumero)+"
        }
    }
    
    
    
    @IBAction func resta(_ sender: Any) {
        if resultadoLabel.text != "" {
            primerNumero = Int(resultadoLabel.text!)!
            operador = "-"
            resultadoLabel.text = "\(primerNumero)-"
        }
        
    }
    
    
    
    @IBAction func multi(_ sender: Any) {
        if resultadoLabel.text != "" {
            primerNumero = Int(resultadoLabel.text!)!
            operador = "x"
            resultadoLabel.text = "\(primerNumero)x"
        }
    }
    
    
    @IBAction func divi(_ sender: Any) {
        if resultadoLabel.text != "" {
            primerNumero = Int(resultadoLabel.text!)!
            operador = "/"
            resultadoLabel.text = "\(primerNumero)/"
        }
    }
    
    @IBAction func igual(_ sender: Any) {
        
        let textoLabel = resultadoLabel.text
        
        // Hacemos un rango hasta el operador para saber donde esta
        let rangoOperador = textoLabel!.range(of: operador!)
        
        // El distance es para saber la distancia desde un comienzo que lo sacamos con el loweBound que es para sacar el inicio de algo o el valor mas bajo.
        let disOperador = textoLabel!.distance(from: textoLabel!.startIndex, to: rangoOperador!.lowerBound)
        
        // Esto es para hacer un subtring y sacar el segundo numero
        // Poniendo un comienzo con el label con startIndex hasta donde este el operador y para que empiece donde hemos dicho usamos el suffix
        let numeroDos = String(textoLabel!.suffix(from: textoLabel!.index(textoLabel!.startIndex, offsetBy: disOperador + 1)))
        
        let segundoNumero = Int(numeroDos)!

        
        var resultado = 0
        
        switch operador {
        case "+":
            resultado = primerNumero + segundoNumero
        case "-":
            resultado = primerNumero - segundoNumero
        case "x":
            resultado = primerNumero * segundoNumero
        case "/":
            if segundoNumero != 0 {
                resultado = primerNumero / segundoNumero
            } else {
                resultadoLabel.text = "entre 0 no"
                return
            }
        default:
            resultadoLabel.text = "error"
            return
        }
        
        resultadoLabel.text = "\(resultado)"
    }



    @IBAction func borrarTodo(_ sender: Any) {
        if resultadoLabel.text != "" {
            resultadoLabel.text = ""
        }
        primerNumero = 0
        segundoNumero = 0
        operador = nil
    }
}


