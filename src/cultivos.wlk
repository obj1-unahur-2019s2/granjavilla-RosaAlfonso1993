import wollok.game.*

class Maiz {
	var property position
	var property esAdulta = false
	
	method image() {
		if(esAdulta){
			return "corn_adult.png"
		}
		else{
			return "corn_baby.png"	
		}
	}
	
	method regate(){
		if(not esAdulta){
			esAdulta = true
		}
	}
	method teChocoUnOso(){self.regate()}
	method cosechar(){
		if(esAdulta){
			game.removeVisual(self)
		}
	}
	method valor(){
		return 150
	}
}

class Trigo{
	var property position
	var listaImagenes = ["wheat_0.png" , "wheat_1.png" , "wheat_2.png" , "wheat_3.png"]
	var indice = 0
	method image(){return listaImagenes.get(indice)}
	
	method regate(){
		indice +=1
		if(indice == 4){indice = 0}
	}
	
	method teChocoUnOso(){
		if (position.x() > 0){
			position = position.left(1)
		}
	}
	method cosechar(){
		if(indice >= 2){
			game.removeVisual(self)
		}
	}
	method valor(){
		return (indice - 1) * 100
	}
}

class Tomaco{
	var property position
	
	method image(){return "tomaco.png"}
	method regate(){
		position = new Position(x = position.x(), y = position.y() + 1)
		if (position.y() == game.height() - 1){
			position = new Position(x = position.x(), y = 0)
		}
	}
	method cosechar(){
		game.removeVisual(self)
	}
	method valor(){
		return 80
	}
}