import UIKit

let cosa = {
  print("cosa")
}

var closure = cosa

let suma = {(valor1: Int, valor2: Int) in
   return valor1 + valor2
}


//----------------//


let suma2 = {(valor1: Int, valor2: Int) in valor1 + valor2 }

var sumar = suma2(1,2)

print(sumar)

//----------------//

let cuadrado = {(valor1: Int) -> Int in
    return valor1 * valor1
}

print(cuadrado(5))

let cuadrado2 = {(valor1: Int) in return valor1 * valor1}

print(cuadrado2(2))

//----------------//


let numeros = [23, 4, 36, 25, 23, 46]

let ordenarArray = { (array: [Int]) in
    return array.sorted(by: >)
}

let ordenarArray2 = { $0.sorted(by: >) }


print(ordenarArray(numeros))

//------------------//


let devolverNum = {
    
    
}


