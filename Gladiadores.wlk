class Gladiador {
    var vida = 100
    method vida() = vida 
    method atacar(unGladiador){
        unGladiador.recibirDaño(self)
    }
    method defensa()
    method recibirDaño(unGladiador){
        vida = vida - unGladiador.poderDeAtaque() - self.defensa()
    }
    method pelea(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    } 
}

class Mirmillones inherits Gladiador{
    var fuerza 
    var armadura
    const arma
    method cambiarFuerza(nuevaFuerza) {
      fuerza = nuevaFuerza
    }
    method destreza() = 15
    method cambiarArmadura(nuevaArmadura) {
      armadura = nuevaArmadura
    }
    override method defensa() = armadura.puntosArmadura(self) + self.destreza()
    method poderDeAtaque() = arma.poderDeAtaque() + fuerza 
    
}

class Dimachaerus inherits Gladiador{
    const armas = []
    var destreza
    method fuerza() = 10
    override method atacar(unGladiador){
        super(unGladiador)
        destreza = destreza + 1
    }
    override method defensa() = destreza / 2
    method poderDeAtaque() = self.fuerza() + armas.sum({a => a.poderDeAtaque()}) 
}

object coliseo{
    const grupos = []

}

class  Grupos {
    const nombre
    var cantidadPeleas
    const gladiadores = []
    method agregarMiembros(unGladiador){
        gladiadores.add(unGladiador)
    }
    method sacarMiembros(unGladiador) {
      gladiadores.delete(unGladiador)
    }
    method campeon() = self.gladiadoresVivos().max({g => g.fuerza()}) 
    method gladiadoresVivos() = gladiadores.filter({g => g.vida() > 0 }) 
    method pelea(otroGrupo) {
        self.campeon().atacar(otroGrupo.campeon())
    } 
}