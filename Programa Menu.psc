Algoritmo CalcularMaterialesDeConstruccion
	Menu()
FinAlgoritmo

SubProceso Menu
	
	Definir op Como Entero
	Definir ldeviga, resultadoviga, cemento, arena, piedra, hierroDel10, hierroDel4, largoColumna, iluminacion Como Real
	
	Repetir
		Escribir "--------------------------------------"
		Escribir "Bienvenido al Menu, ingrese su opcion:"
		Escribir "1. Calcular muro de ladrillo"
		Escribir "2. Calcular viga de hormigón"
		Escribir "3. Calcular columnas de hormigón"
		Escribir "4. Calcular contrapisos"
		Escribir "5. Calcular techo"
		Escribir "6. Calcular pisos"
		Escribir "7. Calcular pintura"
		Escribir "8. Calcular iluminación"
		Escribir "9. Salir"
		Escribir "--------------------------------------"
		Leer op
		
		Segun op Hacer
			caso 1:
				calcularMuro
				
			caso 2:
				Escribir " Ingrese el largo de la viga deseada en metros"
				Leer ldeviga
				Escribir " En base al largo de viga seleccionado los materiales necesarios son: "
				
				resultadoviga = calcularviga(ldeviga)
				
			caso 3:
				Escribir "Ingrese el largo de la columna deseada:"
				Leer largoColumna
				
				calcularColumna(largoColumna, cemento, arena, piedra, hierroDel10, hierroDel4)
				Escribir "Cemento: ", cemento, " kg"
				Escribir "Arena: ", arena, " m3"
				Escribir "Piedra: ", piedra, " m2"
				Escribir "hierro del 10: ", hierroDel10, " mts"
				Escribir "hierro del 4: ", hierroDel4, " mts"
				
			caso 4:
				calcularMaterialesContrapisos
				
			caso 5:
				CalcularTecho
				
			caso 6:
				calcularPisos
				
			caso 7:
				calcularPintura
				
			caso 8:
				calcularIluminacion(iluminacion)
				
			caso 9:
				Escribir "Hasta luego!"
			De Otro Modo:
				Escribir "Ingrese una opcion valida"
		FinSegun
	Mientras Que op <> 9
FinSubProceso

Funcion superficie <- calcularSuperficie ( alto por valor, ancho Por Valor )
	definir superficie Como Real
	superficie = alto * ancho
Fin Funcion

SubProceso calcularMuro
	Definir espesor, alto, ancho, superficie Como real
	Escribir 'Espesor del muro:'
	Escribir '1- 20cm'
	Escribir '2- 30cm'
	Leer espesor
	
	Escribir 'Ingrese alto y ancho del muro: '
	Leer alto, ancho
	
	superficie = calcularSuperficie(alto, ancho)
	Escribir 'Superficie a cubrir: ', superficie, 'm2'
	
	Escribir 'Materiales Necesarios:'
	Si espesor == 1 Entonces
		// 15.2 kg cemento, 0.115m3 arena y 120 ladr x m2
		Escribir 15.2 * superficie, 'Kg de cemento'
		Escribir 0.115 * superficie, 'm3 de arena'
		Escribir 120 * superficie, ' ladrillos'
	FinSi
	Si espesor == 2 Entonces
		// 10.9 kg cemento, 0.09 arena y 90 ladr x m2
		Escribir 10.9 * superficie, 'Kg de cemento'
		Escribir 0.09 * superficie, 'm3 de arena'
		Escribir 90 * superficie, 'ladrillos'
	FinSi
FinSubProceso

Funcion resultadoviga <- calcularviga (ldeviga Por Valor)
	
	Si ldeviga < 1 Entonces
		Escribir "Es necesario que el largo de la viga sea mayor a un metro lineal."
	FinSi
	
	Escribir "En base al largo de viga seleccionado los materiales necesarios son: "
	Escribir "Se necesitan ", ldeviga * 9 , " kg de Cemento, " Sin Saltar
	Escribir ldeviga * 0.02, "m2 de piedra, " Sin Saltar
	Escribir ldeviga * 4, "m de hierro del 8, " Sin Saltar
	Escribir ldeviga * 3, "m de hierro del 4 "
	
FinFuncion

SubProceso calcularColumna(largoColumna, cemento Por Referencia, arena Por Referencia, piedra Por Referencia, hierroDel10 Por Referencia, hierroDel4 Por Referencia)
	cemento = largoColumna * 7.5
	arena = largoColumna * 0.016
	piedra = largoColumna * 0.016
	hierroDel10 = largoColumna * 6
	hierroDel4 = largoColumna * 3
FinSubProceso

SubProceso calcularMaterialesContrapisos
	
	definir espesor, ancho, largo Como real
	definir volumen Como Real
	definir cementoPorM3, arenaPorM3, piedraPorM3 Como Real
	definir cementoTotal, arenaTotal, piedraTotal Como Real
	
	cementoPorM3 <- 105 // kg
	arenaPorM3 <- 0.45 // m3
	piedraPorM3 <- 0.9 // m3
	
	Escribir "Ingrese el espesor del contrapiso en metros: "
	Leer espesor
	Escribir "Ingrese el ancho del contrapiso en metros: "
	Leer ancho
	Escribir "Ingrese el largo del contrapiso en metros: "
	Leer largo
	
	volumen <- espesor * ancho * largo
	
	cementoTotal <- volumen * cementoPorM3
	arenaTotal <- volumen * arenaPorM3
	piedraTotal <- volumen * piedraPorM3
	
	Escribir "Para un contrapiso con las siguientes dimensiones:"
	Escribir "ESPESOR: ", espesor, " m ", "ANCHO: ", ancho, " m ", "LARGO: ", largo, " m ", "VOLUMEN TOTAL: ", volumen, " m3 "
	Escribir "Cantidad total de cemento necesario: ", cementoTotal, " kg"
	Escribir "Cantidad total de arena necesaria: ", arenaTotal, " m3"
	Escribir "Cantidad total de piedra necesaria: ", piedraTotal, " m3"
FinSubProceso

Funcion volumen = CalcularVolumen(espesor, ancho, largo)
	
	Definir volumen Como Real
	volumen = espesor * ancho * largo
	
FinFuncion

SubProceso CalcularTecho
	Definir espesor, ancho, largo, volumen Como Real
	Definir materialesCemento, materialesArena, materialesPiedra, materialesHierro8, materialesHierro6 Como Real
	
	// Solicitar al usuario las dimensiones del techo
	Escribir "Ingrese el espesor del techo (en metros): "
	Leer espesor
	Escribir "Ingrese el ancho del techo (en metros): "
	Leer ancho
	Escribir "Ingrese el largo del techo (en metros): "
	Leer largo
	
	volumen = CalcularVolumen(espesor, ancho, largo)
	
	materialesCemento = volumen * 33 // kg
	materialesArena = volumen * 0.072 // m3
	materialesPiedra = volumen * 0.072 // m3
	materialesHierro8 = volumen * 7 //m
	materialesHierro6 = volumen * 4 //m
	
	
	Escribir "=================================================="
	Escribir "Materiales necesarios para el techo:"
	Escribir "Cemento: ", materialesCemento, " kg"
	Escribir "Arena: ", materialesArena, " m3"
	Escribir "Piedra: ", materialesPiedra, " m3"
	Escribir "Hierro del 8: ", materialesHierro8, " m"
	Escribir "Hierro del 6: ", materialesHierro6, " m"
	Escribir "=================================================="
FinSubProceso

SubProceso calcularPisos
	definir x como real
	definir ancho como real
	Definir largo Como Real
	Escribir "ingrese ancho del paño del piso"
	Leer ancho
	Escribir "ingrese largo del paño del piso"
	leer largo
	x = (calcularSuperficie(ancho, largo))*1.1
	escribir "se necesitan " x " m2"
FinSubProceso

// Subprograma para calcular la cantidad de pintura
SubProceso calcularPintura
	Definir superficie, litrosPintura Como Real
	
	Escribir "Ingrese la superficie a pintar (m2): "
	Leer superficie
	
	litrosPintura = superficie / 6
	
	Escribir "Se necesitarán ", litrosPintura, " litros de pintura"
FinSubProceso

Subproceso calcularIluminacion(iluminacion Por Referencia)
	Definir superficie, ancho, largo Como Real
	
	Escribir "Ingrese el alto y ancho de la habitacion a calcular la iluminacion"
	Leer ancho, largo
	
	superficie = calcularSuperficie(ancho, largo)
	iluminacion = 0.2 * superficie
	Escribir "La iluminacion minima necesaria para una superficie de ", superficie, " m^2 es de ", iluminacion
FinSubProceso