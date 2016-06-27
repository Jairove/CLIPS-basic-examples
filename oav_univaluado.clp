; Jairo Velasco Martin
; Ejemplo de solucion que asegurar la semantica univaluada para OAV
; Enero de 2016

(deftemplate oav-u
	(slot objeto (type SYMBOL)) 
	(slot atributo(type SYMBOL)) 
	(slot valor))

(deffacts hechos-supuestamente-univaluados 
	(oav-u (objeto Juan)(atributo edad)(valor 35)) 
	(oav-u (objeto Juan)(atributo edad)(valor 41))
	(oav-u (objeto Juan)(atributo edad)(valor 44))
)

;Se da por bueno el ultimo valor y se eliminan el resto
(defrule asegurar-unicidad
	(declare (salience 10000))
	?f1 <- (oav-u (objeto ?o)(atributo ?a)(valor ?v1))
	?f2 <- (oav-u (objeto ?o)(atributo ?a)(valor ?v2))
	(test(<> ?v1 ?v2))
	=>
	(retract ?f2)
)

(defrule conseguir-edad
	(oav-u  (objeto Juan)
		(valor ?x))
	=>
	(printout t "La edad es:" ?x crlf)
)