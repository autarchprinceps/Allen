; Eine Mustereingabe -das Format legen Sie fest! 
; Hier wir eine LISP-ähnliche Notation verwendet
;
; (r <ereignis 1> <ereignis 2> (<zeitliche Beziehungen zwischen diesen>))

(r 'A 'B '(< m))
(r 'B 'C '(m o d))
(r 'C 'A '(m < > = mi))
(r_exist 'A '(B C) '(o d di));  - hier wird der Existenzquantor eingesetzt
(r_exist '(A B) '(B C) '(o))

; Ihe Aufgabe: Bestimmen Sie die Konsistenz aufgrund dieser Angaben. 
; Beachten Sie: besteht weder zwischen AB noch AC eine der Beziehungen (o d di) so is die Existenz-Bedingung nicht erfüllt.
