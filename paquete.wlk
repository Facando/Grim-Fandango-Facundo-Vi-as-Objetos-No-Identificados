class Paquete{
  const valorBasico
  var tiempo
  method aniosQueReduce() 

  method costo() = (valorBasico * self.aniosQueReduce().min(350)
}



class PaqueteTren inherits Paquete{
    override method valorBasico() = 100 
    override method aniosQueReduce()=4
}

class PaqueteBote inherits Paquete {
  override method valorBasico() = 50
  overrride method aniosQueReduce()= alma.accionesBuenas() / 50).min(2)
  }

  class PaquetePaloConBrujula inherits Paquete {
  override method valorBasico() = 30   
  override method aniosQueReduce() = 0.05
  override method costoBasico() = self.valorBasico()
  
  
  
  
  }
