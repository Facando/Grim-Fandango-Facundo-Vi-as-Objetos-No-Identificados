object departamento{
  const property agentes = []

  method mejorAgente(){
    agentes.max({agente => agente.dineroTotal()})
  }

  method veriFicarDeuda(){
    agentes.forEach({agente => self.pagoSuDeuda(agente)})
  }

  method pagoSuDeuda(agente){
    if(agente.deudaActual()==0){
      agentes.remove(agente)
    } else {
      agente.agrandarDeuda(100)
    }
  }

  method noPagaronDeuda(){
    agentes.filter({agente => !agente.deudaPagada() })
  }

  method pasarDiaDelosMuertos(){
    self.mejorAgente().achicarDeuda(50)
    self.veriFicarDeuda()
  }
}

class Agente{
  var deudaActual
  var estrategia
  var ventas = 0  
 method registrarVenta()= ventas + 1
 method estrategiaNueva (nueva) {estrategia = nueva}
 const property paquetesVendidos = []
  method deudaActual() = deudaActual

  method achicarDeuda(cantidad){
    deudaActual -= cantidad
  }

  method agrandarDeuda(cantidad){
    deudaActual += cantidad
  }
  method deudaPagada() = deudaActual <= 0
 

  method dineroTotal() = paquetesVendidos.sum({paquete => paquete.costo()})


  method venderPaquete(paquete, alma){
    if(paquete.costo() > alma.capital()){
      throw new Exception(message = "alma no dispone del capital suficiente")
    }
    alma.reducirCapital(paquete.costo())
    paquetesVendidos.add(paquete)
  }
  method atenderAlma() {  
    const paquete = estrategia.armarPaquete(alma) 

      self.venderPaquete(paquete, alma)
      self.registrarVenta()
    
  }

  



}

class Almas{
 

  var capital
  
  var property accionesBuenas = 0
  method capital() = capital
  method reducirCapital(cantidad) { capital -= cantidad }
}



object estrategiaClasica {
  method armarPaquete(alma) =
    departamento.paquetesPredefinidos()
      .filter({ p => p.costo() <= alma.capital() })
      .max({ p => p.costo() })
}

object estrategiaNavegante {
  method armarPaquete(alma) =
    if (alma.accionesBuenas() >= 50)
      new Crucero(valorBasico = alma.accionesBuenas())
    else
      new Bote(valorBasico = alma.accionesBuenas())
}

object estrategiaIndiferente {
  method armarPaquete(alma) =
    new PaloConBrujula(valorBasico = (1.randomUpTo(300)).truncate(0))
}
