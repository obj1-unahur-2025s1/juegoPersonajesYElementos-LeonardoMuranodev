object luisa {
    var personajeActivo = floki

    method cambiarPersonajeActivo(personaje) {
        personajeActivo = personaje
    }

    method aparece(elemento) {
        personajeActivo.encontrar(elemento)
    }
}

//Personajes
object floki {
    var arma = ballesta

    method encontrar(elemento) {
        arma.atacar(elemento)
    }
}

object mario {
    var valorRecolectado = 0
    var ultimoElemento = tipa

    method valorRecolectado() = valorRecolectado
    method esFeliz() = self.valorRecolectado()  >= 50 || self.ultimoElemento.altura() >= 10
    
    method encontrar(elemento) {
        elemento.interactuarCon(mario)
        ultimoElemento = elemento
    }

    method aumentarValorRecolectado(valor) {
        valorRecolectado += valor
    }
}

//Armas
object ballesta {
    var flechas = 10

    method potencia() = 4
    method flechas() = flechas
    method estaCargada() = flechas > 0

    method dispararBallesta() {
        flechas -= 1
    }

    method atacar(elemento) {
        if (self.estaCargada()) {
            self.dispararBallesta()
            elemento.recibirAtaque(self.potencia())
        }
    }
}

object jabalina {
    var carga = 1

    method potencia() = 30
    method estaCargada() = carga > 0

    method lanzarJabalina() {
        carga -= 1
    }

    method atacar(elemento) {
        if (self.estaCargada()) {
            self.lanzarJabalina()
            elemento.recibirAtaque(self.potencia())
        }
    }
}

//Elementos
object castillo {
    var defensa = 150

    method altura() = 20
    method defensa() = defensa

    method recibirAtaque(potencia) {
        defensa -= potencia
    }

    method interactuarCon(personaje) {
        personaje.aumentarValorRecolectado(self.defensa()/5) 
        defensa = min(200, defensa + 20)
    }
}

object aurora {
    var estaViva = true

    method altura() = 1
    method estaViva() = estaViva

    method recibirAtaque(potencia) {
        if(potencia > 10) {
            estaViva = false
        }
    }

    method interactuarCon(personaje) {
        personaje.aumentarValorRecolectado(15)
    }
}

object tipa {
    var altura = 8
    
    method altura() = altura

    method recibirAtaque(potencia) {}

    method interactuarCon(personaje) {
        personaje.aumentarValorRecolectado(self.altura()*2) 
        altura += 1
    }
}

