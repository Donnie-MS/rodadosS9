/*
Flotas de rodados
En este ejercicio vamos a construir un modelo que pueda servir para la administración de las flotas
 de rodados que utilizan las distintas dependencias de la Municipalidad de Coronel Vallejos.

Etapa 1 - Rodados y dependencias
De cada rodado nos van a interesar: capacidad (o sea, cuántos pasajeros puede transportar),
 velocidad máxima, color y peso.

A continuación se describen los rodados que maneja la muncipalidad.


Varios Renault Kwid que funcionan a gas. Cada uno de ellos puede tener puesto, o no, un tanque adicional.

La capacidad de un Kwid es de 4 pasajeros si no tiene puesto el tanque adicional, o 3 pasajeros si sí lo tiene puesto.
La velocidad máxima es 120 km/h con, o 110 km/h sin, tanque adicional.
El peso es 1200 kg, más 150 kg adicionales si tiene tanque adicional.
Todos los autos de este tipo con que cuenta la municipalidad son azules.


*/
/*
object chevroletCorsa {
  var colorActual = null
  method capPasajeros() = 4
  method maxVelocidad() = 150
  method peso() = 1300
  method color() = colorActual
  method color(nuevoColor) {
    colorActual = nuevoColor
  }
}

object renaultKwid {
  method esAGas() = true
  method tieneTanqueAdicional() = true
  method capPasajeros() {
    var resultado = 4
    if (self.tieneTanqueAdicional()) {
      resultado = 3
    }
    return resultado
  }
}
*/

class Corsa {
    var property color// tiene que indicar en la consigna si viene inicializado o no(Informar si o si en el constructor)
    method capacidad() = 4
    method velocidadMaxima() = 150
    method peso() = 1300
}

//new Corsa(color= "rojo")
//const corsa1 = new Corsa(color = "rojo")
//const listaDeAuto = [new Corsa(color = "rojo")]
// listaDeAuto.add(new Corsa(color = "rojo")) // otra instancia de la clase Corsa
//const primerAuto = listaDeAuto.get(0) // get para lista
class Kwid {
    var tieneTanqueAdicional
    method capacidad() = if(tieneTanqueAdicional) 3 else 4
      //NO HACE FALTA HACER VAR SI YA CALCULA LA CAPACIDAD un metodo
    method velocidadMaxima() = if (tieneTanqueAdicional) 120 else 110
    method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
    method color() = "azul"
}

object trafic {//Como solo hay una, no se hace una clase
    var property interior = comodo
    var property motor = pulenta
    method capacidad() = interior.capacidad()
    method peso() = 4000 + motor.peso() + interior.peso()
    method velocidadMaxima() = motor.velocidad()
    method color() = "blanco"
}

class Especial {//no poner a property si no hace falta
    var property capacidad
    var property peso
    var property color
    const  velocidadMaxima// nace con una velocidadMaxima y no cambia nunca
    method velocidadMaxima()  = velocidadMaxima.min(topeVelocidadMaxima.tope())

}

object topeVelocidadMaxima {
    var property tope = 200
}
// const especial2 = new Especial(capacidad, peso=1500, color="azul", velocidadMaxima = 180)
object pulenta {
    method peso() = 800
    method velocidad() =130
}
object bataton {
    method peso() = 500
    method velocidad() = 80
}
object comodo {
    method capacidad() = 5
    method peso() = 1000
}
object popular {
    method capacidad() = 12
    method peso() = 700
}

class Dependencia {
    const flota = []
    var property empleados = 0

    method agregarAFlota(unRodado) {flota.add(unRodado)}
    method quitarDeFlota(unRodado) {flota.remove(unRodado)}
    method pesoTotalFlota() = flota.sum({rodado => rodado.peso()})
    method estaBienEquipada() = self.tieneAlMenosRodados(3) && self.todosLosRodadosPuedenIrA100()
    method cantRodados() = flota.size()
    method tieneAlMenosRodados(cantidad) = self.cantRodados() >= cantidad
    method todosLosRodadosPuedenIrA100() = flota.all({rodado => rodado.velocidadMaxima() >= 100})
    method capacidadTotalEnColor(unColor) = self.rodadosDeColor(unColor).sum({rodado => rodado.capacidad()})
    method rodadosDeColor(unColor) = flota.filter({rodado => rodado.color() == unColor})
    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
    method rodadoMasRapido() = flota.max({rodado => rodado.velocidadMaxima()})
    method capacidadFaltante() = (self.empleados() - self.capacidadDeLaFlota()).max(0)
    method capacidadDeLaFlota() = flota.sum({rodado => rodado.capacidad()})
    method esGrande() = empleados >= 40 && self.tieneAlMenosRodados(5)
}