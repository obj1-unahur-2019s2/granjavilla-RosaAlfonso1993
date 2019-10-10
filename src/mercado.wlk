import wollok.game.*
import hector.*

class Mercado{
	var property position 
	var property image = "market.png" 
	var property monedas = 2000
	
	method mercadear(){
		if(monedas > hector.sumaDeLoQueTieneParaVender()){
			hector.venderTodo()
			monedas -= hector.sumaDeLoQueTieneParaVender()
			game.say(self, "quedan" + monedas)
		}

	}
}
