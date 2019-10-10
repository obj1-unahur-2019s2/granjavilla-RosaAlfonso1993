import wollok.game.*
import hector.*
import cultivos.*
import oso.*
import direcciones.*
import mercado.*

object juegoGranja{
	var personaje = hector
	// var elOsoSeMueve = false
	var mercado = new Mercado(position = new Position(x = 9, y = 0))
		var mercado1 = new Mercado(position = new Position(x = 0, y = 9))
		var mercado2 = new Mercado(position = new Position(x = 0, y = 0))
		
	
	method configurarTeclado(){
		keyboard.m().onPressDo({hector.plantarMaiz()})
	
		keyboard.r().onPressDo({hector.regarPlanta()})
	
		keyboard.c().onPressDo({hector.cosecharPlanta()})
	
		keyboard.p().onPressDo({game.say(hector, "tengo cosechadas" + hector.cantidadDePlantasCosechadas() + "plantas")})
	
		keyboard.t().onPressDo({hector.plantarTrigo()})
	
		keyboard.o().onPressDo({hector.plantarTomaco()})
		
		keyboard.v().onPressDo({hector.venderTodo()})
		
		keyboard.space().onPressDo({game.say(hector,"hay " + hector.cantidadDePlantasCosechadas() + " plantas cosechadas y " + hector.oro() + " de oro ")})
		
		self.configurarMovimientos()
	}
	
	method configurarMovimientos(){
		keyboard.left().onPressDo({personaje.moverseIzquierda()})
		keyboard.down().onPressDo({personaje.moverseAbajo()})
		keyboard.up().onPressDo({personaje.moverseArriba()})
		keyboard.right ().onPressDo({personaje.moverseDerecha()})
	}
	method configurarAcciones(){
		//el oso se mueve siempre para el este
		//game.onTick(1000, "movimientoOso",{oso.moverEnDireccion(este)})
		
		//el oso se mueve aleatoriamente para algun lado : norte sur este o oeste
		game.onTick(1000, "moviendoOso",{
			
			var dado = (1..1).map({n => 0.randomUpTo(4).truncate(0)})
			
			if(dado == 0 and oso.position().y() < game.height() - 1){
				oso.position(oso.position().up(1))
			}else if(dado == 1 and oso.position().y() > 0){
				oso.position(oso.position().down(1))
			}else if(dado == 2 and oso.position().x() > 0){
				oso.position(oso.position().left(1))
			}else if(dado == 3 and oso.position().x() < game.width() - 1){
				oso.position(oso.position().right(1))
			}
		})
	}
	method configurarPersonajes(){
		game.addVisual(hector)
 		game.addVisual(oso)
	}
	
	method configurarMercado(){
		
		game.addVisual(mercado)
		game.addVisual(mercado1)
		game.addVisual(mercado2)
	}
	
	method configurarColision(){
		game.whenCollideDo(oso,{objeto => objeto.teChocoUnOso()})
		game.whenCollideDo(mercado, {objeto => objeto.mercader()})
		game.whenCollideDo(mercado1, {objeto => objeto.mercader()})
		game.whenCollideDo(mercado2, {objeto => objeto.mercader()})
	}
	method cambiarPersonaje(){
		keyboard.j().onPressDo({personaje = oso})
	
		keyboard.h().onPressDo({personaje = hector})
	}
}
