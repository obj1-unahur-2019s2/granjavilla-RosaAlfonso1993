import wollok.game.*
import direcciones.*

object oso {
	var property position = new Position(x =3, y=2)
	var property image = "oso.png"
	
	method moverseIzquierda(){if(position.x() > 0){position = position.left(1)}}
	method moverseAbajo(){if(position.y() > 0){position = position.down(1)}}
	method moverseArriba(){if(position.y() < game.height()-1){position = position.up(1)}}
	method moverseDerecha(){if(position.x() < game.width() - 1){position = position.right(1)}}
	
	method moverEnDireccion(direccion){
		self.position(direccion.siguientePosicion(self.position()))
		// es igual a:
		// position = direccion.siguientePosition(position)
	}
	
	method moveteAlAzar(){
		var dado = 1.randomUpTo(5).truncate(0)
		
		if (dado == 1){self.moverEnDireccion(oeste)}
		else if(dado == 2){self.moverEnDireccion(norte)}
		else if(dado == 3){self.moverEnDireccion(este)}
		else{self.moverEnDireccion(sur)}
	}
}
