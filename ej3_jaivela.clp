; Ejercicio 3
; Diagnostico coches
; Jairo Velasco Martin

; Algunos hechos

(deffacts fallos "Bateria cero"
				(comportamiento_motor no_arranca)
				(indicador_bateria cero)
)

(deffacts fallos "Combustible cero"
				(comportamiento_motor se_para)
				(indicador_combustible cero)
)

; Reglas

(defrule motor-para "El motor se para"
	(comportamiento_motor se_para)
=>
	(assert (combustible_motor falso))
)


(defrule motor-no-arranca "El motor no arranca"
	(comportamiento_motor no_arranca)
=>
	(assert (combustible_motor falso)
			(potencia desconectada)
	)
)

(defrule causa-deposito "El deposito esta vacio"
	(combustible_motor falso)
	(indicador_combustible cero)
=>
	(assert (deposito_combustible vacio))
)

(defrule causa-bateria "La bateria esta baja"
	(potencia desconectada)
	(indicador_bateria cero)
=>
	(assert (bateria baja))
)

(defrule causa-fusible "El fusible esta fundido"
	(potencia desconectada)
	(inspeccion_fusible roto)
=>
	(assert (fusible fundido))
)