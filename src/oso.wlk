import wollok.game.*

object oso {
	var property position = new Position(x =3, y=2)
	var property imagen = "oso.png"
	
	method moverseIzquierda(){position = position.left(1)}
	method moverseAbajo(){position = position.down(1)}
	method moverseArriba(){position = position.up(1)}
	method moverseDerecha(){position = position.right(1)}
}
