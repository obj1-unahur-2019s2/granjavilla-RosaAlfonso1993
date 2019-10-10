import wollok.game.*
import cultivos.*

object hector {
	var property position = new Position(x = 3, y = 3)
	const property image = "player.png"
	var property plantasCosechadas = []
	var property oro = 0
	
	method plantarMaiz(){
		game.addVisual(new Maiz(position = self.position()))
	}
	
	method plantarTrigo(){
		game.addVisual(new Trigo(position = self.position()))
	}
	
	method plantarTomaco(){
		game.addVisual(new Tomaco(position = self.position()))
	}

	method regarPlanta(){
		game.colliders(self).forEach({planta => planta.regate()})
		//devuelve una lista con lo que se choque el objeto, si no hay nada devuelve una lista vacia
	}
	method cosecharPlanta(){
		if(not game.colliders(self).isEmpty()){
			game.colliders(self).forEach({planta => planta.cosechar()
			plantasCosechadas.add(planta)})
		}
		else{
			game.say(self, "no se puede cosechar")
		}
			
	}
	method cantidadDePlantasCosechadas(){
		return plantasCosechadas.size()
	}
	method moverseIzquierda(){if(position.x() > 0){position = position.left(1)}}
	method moverseAbajo(){if(position.y() > 0){position = position.down(1)}}
	method moverseArriba(){if(position.y() < game.height()-1){position = position.up(1)}}
	method moverseDerecha(){if(position.x() < game.width() - 1){position = position.right(1)}}
	
	//mercado
	
	method sumaDeLoQueTieneParaVender(){
		return plantasCosechadas.sum({planta => planta.valor()})
	}
	method venderTodo(){
		oro += self.sumaDeLoQueTieneParaVender()
		plantasCosechadas.clear()
	}
}