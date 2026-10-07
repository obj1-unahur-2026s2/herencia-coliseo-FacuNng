import Gladiadores.*


// armas
class Arma{
  method poderAtaque()   
}

class ArmasDeFilo inherits Arma{
  const longitud
  const filo 
  override method poderAtaque() = (filo.max(0)).min(1) * longitud
}

class Contundentes inherits Arma{
  const peso
  override method poderAtaque() = peso 
}

class Armadura {
  method puntosArmadura(gladiador)  
}
class Casco inherits Armadura{
  override method puntosArmadura(gladiador) = 10 
}

class Escudos inherits Armadura{  
  override method puntosArmadura(gladiador) = 5 + gladiador.destreza() * 0.10
}

