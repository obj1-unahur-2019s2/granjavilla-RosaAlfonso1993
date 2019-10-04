import wollok.game.*
import cultivos.*

object hector {
	var property position = new Position(x = 3, y = 3)
	const property image = "player.png"
	var property plantasCosechadas = []
	
	method plantarMaiz(){
		game.addVisual(new Maiz(position = self.position()))
	}
	method plantarTrigo(){
		game.addVisual(new Trigo(position = self.position()))
	}
	method regarPlanta(){
		game.colliders(self).forEach({planta => planta.regate()})
		//devuelve una lista con lo que se choque el objeto, si no hay nada devuelve una lista vacia
	}
	method cosecharPlanta(){
		game.colliders(self).forEach({planta => game.removeVisual(planta)
		plantasCosechadas.add(planta)
		})
		
	}
	method cantidadDePlantasCosechadas(){
		return plantasCosechadas.size()
	}
	method moverseIzquierda(){position = position.left(1)}
	method moverseAbajo(){position = position.down(1)}
	method moverseArriba(){position = position.up(1)}
	method moverseDerecha(){position = position.right(1)}
}