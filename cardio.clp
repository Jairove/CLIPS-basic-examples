(deftemplate oav
	(slot objeto (type SYMBOL)) 
	(slot atributo(type SYMBOL)) 
	(multislot valor)
)

(deffacts hechos-iniciales
	(oav (objeto aneurismaAbdominal) (atributo afecta) (valor vasos-sanguineos))
	(oav (objeto estenosisArterial) (atributo afecta) (valor vasos-sanguineos))
	(oav (objeto arterioesclerosis) (atributo afecta) (valor vasos-sanguineos))
	(oav (objeto regurgitacionAortica) (atributo afecta) (valor corazon))
	(oav (objeto paciente-1) (atributo nombre) (valor Marta))
	(oav (objeto paciente-1) (atributo sexo) (valor mujer))
	(oav (objeto paciente-1) (atributo edad) (valor 12))
	(oav (objeto paciente-1) (atributo sintomas) (valor fiebre))
	(oav (objeto paciente-1) (atributo evidencia) (valor rumorDiastolico))
	(oav (objeto paciente-1) (atributo presion-sistolica) (valor 150))
	(oav (objeto paciente-1) (atributo presion-diastolica) (valor 60))
	(oav (objeto paciente-2) (atributo nombre) (valor Luis))
	(oav (objeto paciente-2) (atributo sexo) (valor hombre))
	(oav (objeto paciente-2) (atributo edad) (valor 60))
	(oav (objeto paciente-2) (atributo sintomas) (valor dolorAbdominal))
	(oav (objeto paciente-2) (atributo evidencia) (valor rumorAbdominal masaPulsante))
	(oav (objeto paciente-2) (atributo presion-sistolica) (valor 130))
	(oav (objeto paciente-2) (atributo presion-diastolica) (valor 90))
)

(defrule tipo-enfermedad
	(oav(objeto ?enfermedad) (atributo afecta) (valor vasos-sanguineos | corazon))
	=>
	(assert(oav(objeto ?enfermedad) (atributo tipo) (valor cardiovascular)))
)

(defrule diagnosticar-aneurisma
	(oav (objeto ?paciente) (atributo sintomas) (valor dolorAbdominal))
	(oav (objeto ?paciente) (atributo evidencia) (valor rumorAbdominal masaPulsante))
	(oav (objeto ?paciente) (atributo nombre) (valor ?nombre))
	=>
	(assert(oav (objeto ?paciente) (atributo posibles-enfermedades) (valor aneurismaAbdominal)))
	(printout t "El " ?paciente " de nombre " ?nombre " es posbile que padezca de aneurisma abdominal" crlf)
)

(defrule diagnosticar-regurgitacion
	(oav (objeto ?paciente) (atributo presion-sistolica) (valor ?presions & :(>= ?presions 150)))
	(oav (objeto ?paciente) (atributo presion-diastolica) (valor ?presiond & :(>= ?presiond 50)))
	(oav (objeto ?paciente) (atributo evidencia) (valor rumorSistolico | dilatacionCorazon))
	(oav (objeto ?paciente) (atributo nombre) (valor ?nombre))
	=>
	(assert(oav (objeto ?paciente) (atributo posibles-enfermedades) (valor regurgitacionAortica)))
	(printout t "El " ?paciente " de nombre " ?nombre " es posbile que padezca de regurgitacion aortica" crlf)
)

(defrule diagnosticar-estenosis
	(oav (objeto ?paciente) (atributo sintomas) (valor calambresPiernas))
	(oav (objeto ?paciente) (atributo nombre) (valor ?nombre))
	=>
	(assert(oav (objeto ?paciente) (atributo posibles-enfermedades) (valor estenosisArterial)))
	(printout t "El " ?paciente " de nombre " ?nombre " es posbile que padezca de estenosis arteorial" crlf)
)

(defrule diagnosticar-arteriosclerosis
	(oav (objeto ?paciente) (atributo posibles-enfermedades) (valor estenosisArterial))
	(oav (objeto ?paciente) (atributo edad) (valor ?edad & :(>= ?edad 50)))
	(oav (objeto ?paciente) (atributo nombre) (valor ?nombre))
	=>
	(assert(oav (objeto ?paciente) (atributo posibles-enfermedades) (valor arteriosclerosis)))
	(printout t "El " ?paciente " de nombre " ?nombre " es posbile que padezca de arteriosclerosis" crlf)
)