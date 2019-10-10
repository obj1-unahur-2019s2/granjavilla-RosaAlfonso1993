import wollok.game.*

object este {
	method siguientePosicion(position){
		if(position.x() == game.width()-1){
			return position
		}
		else{
			return position.right(1)
		}
	}
}

object norte{
	method siguientePosicion(position){
		if(position.y() == game.height()-1){
			return position
		}
		else{
			return position.up(1)
		}
	}
}

object sur{
	method siguientePosicion(position){
		if(position.y() == 0){
			return position
		}
		else{
			return position.down(1)
		}
	}
}

object oeste{
	method siguientePosicion(position){
		if(position.x() == 0){
			return position
		}
		else{
			return position.left(1)
		}
	}
}