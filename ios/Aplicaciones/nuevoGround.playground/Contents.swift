import UIKit

let almacen = UserDefaults.standard

// para guardar
almacen.set(23, forKey: "edad")
almacen.set(true, forKey: "acepta")
almacen.set(CFloat.pi, forKey: "pi")

let array = ["alber", "Felipoe", "Edu"]
almacen.set(array, forKey: "arrayNombre")

let diccionario = ["1": "uno", "2": "dos", "3": "tres"]
almacen.set(diccionario, forKey: "numeros")

// actualmente se actualiza solo
almacen.synchronize()

// para recuperar los datos
let edad = almacen.integer(forKey: "edad")
let boolena = almacen.bool(forKey: "acepta")
let pi = almacen.double(forKey: "pi")
let arraynuevo = almacen.array(forKey: "arrayNombre")
let diccionuevo = almacen.dictionary(forKey: "numeros")

// para cualquier tipo de datos pero despues hay que castearlo al dato que se quiera usar
let dicc = almacen.object(forKey: "numeros") as? [String: String] ?? [:]

// para borrar algo guardado en UserDefault
almacen.removeObject(forKey: "pi")
let pi2 = almacen.double(forKey: "pi")

// eliminar todos los valores de UserDefault
almacen.dictionaryRepresentation().keys.forEach{ key in
    almacen.removeObject(forKey: key)
    print("Se ha eliminado el valor de \(key)")
}

