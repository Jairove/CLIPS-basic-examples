; Ejercicio 4
; Asistente al diagnostico
; Jairo Velasco Martin

; Hechos iniciales

(deffacts hechos-iniciales "Estado inicial"
				(comp outside live t)
				(comp w5 conectado outside)
				(comp cb1 ok t)
				(comp s3 estado up)
				(comp s3 ok t)
				(comp l2 light t)
				(comp l2 ok t)
				(comp l2 conectado w4)
				(comp cb2 ok t)
				(comp p2 conectado w6)
				(comp p1 conectado w3)
				(comp p1 ok t)
				(comp p2 ok t)
				(comp s1 conectado w3)
				(comp s1 ok t)
				(comp s1 estado down)
				(comp s2 ok t)
				(comp s2 estado up)
				(comp w0 conectado s2)
				(comp l1 conectado w0)
				(comp l1 light t)
				(comp l1 ok t)
)

; Reglas de la instancia especifica

(defrule estado-cb1 "cb1 ok"
	(comp cb1 ok t)
=>
	(assert (comp w3 conectado w5))
)

(defrule estado-cb2 "cb2 ok"
	(comp cb2 ok t)
=>
	(assert (comp w6 conectado w5))
)

(defrule estado-s3 "s3 ok y up"
	(comp s3 ok t)
	(comp s3 estado up)
=>
	(assert (comp w4 conectado w3))
)

(defrule estado-s1-down "s1 ok y down"
	(comp s1 ok t)
	(comp s1 estado down)
=>
	(assert (comp w2 conectado w3))
)

(defrule estado-s1-up "s1 ok y up"
	(comp s1 ok t)
	(comp s1 estado up)
=>
	(assert (comp w1 conectado w3))
)

(defrule estado-s2-down "s2 ok y down"
	(comp s2 ok t)
	(comp s2 estado down)
=>
	(assert (comp w0 conectado w2))
)

(defrule estado-s2-up "s2 ok y up"
	(comp s2 ok t)
	(comp s2 estado up)
=>
	(assert (comp w0 conectado w1))
)


; Reglas generales

(defrule componente-live "averigua si un componente tiene corriente"
	(comp ?obj1 conectado ?obj2)
	(comp ?obj2 live t)
=>
	(assert (comp ?obj1 live t))
)

(defrule bombilla-lit "averigua si luce bombilla"
	(comp ?objeto light t)
	(comp ?objeto live t)
	(comp ?objeto ok t)
=>
	(assert (comp ?objeto lit t))
)