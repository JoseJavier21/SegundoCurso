import UIKit

var cosa = {
  print("cosa")
}

var closure = cosa

//----------------//

var suma = { (valor1: Int, valor2: Int) in
   return valor1 + valor2
}


var suma2 = {(valor1: Int, valor2: Int) in valor1 + valor2 }

var sumar = suma2(1,2)

print(sumar)

//----------------//

var cuadrado = {(valor1: Int) -> Int in
    return valor1 * valor1
}

print(cuadrado(5))

var cuadrado2 = {(valor1: Int) in return valor1 * valor1}

print(cuadrado2(2))

//----------------//


var numeros = [23, 4, 36, 25, 23, 46]

var ordenarArray = { (array: [Int]) in
    return array.sorted(by: >)
}

var ordenarArray2 = numeros.sorted(by: { $0 < $1})


print(ordenarArray(numeros))

//------------------//


var _ = {3581}()
