; Einsammeln von Ausdrücken aus einer Datei

(defvar *extfile*)

(setq *extfile* nil)

(DEFUN LOAD_extfile (Dateiname)
	(LET ((STREAM (OPEN Dateiname :DIRECTION :INPUT)))
		(DO ((Ausdruck NIL (READ STREAM NIL STREAM)))
		((EQ Ausdruck STREAM) (CLOSE STREAM))
		(setq *extfile* (cons Ausdruck *extfile*)))))
; diese liegen anschließend in einer Liste zusammengefasst in der Variable *extfile*

; stores converted relations from file
(defvar *lrs*)
(setq *lrs* '())

; REPLACETHIS
(defun r (one two lr)
	(add one two lr '*lrs*)
)

; converts a statement loaded from file and stores it in globalselector
(defun add (one two lr globalselector)
  (cond ((equal one 'A)
         (cond ((equal two 'B) (set globalselector (cons (list 'k lr) (symbol-value globalselector))))
               ((equal two 'C) (set globalselector (cons (list 'h lr) (symbol-value globalselector))))
               ;(T (print "ERROR: wrong parameter name"))
               )
         )
        ((equal one 'B)
         (cond ((equal two 'A) (set globalselector (cons (list 'k (inverse lr)) (symbol-value globalselector))))
               ((equal two 'C) (set globalselector (cons (list 'g lr) (symbol-value globalselector))))
               ;(T (print "ERROR: wrong parameter name"))
               )
         )
        ((equal one 'C)
         (cond ((equal two 'A) (set globalselector (cons (list 'h (inverse lr)) (symbol-value globalselector))))
               ((equal two 'B) (set globalselector (cons (list 'g (inverse lr)) (symbol-value globalselector))))
               ;(T (print "ERROR: wrong parameter name"))
               )
         )
        ;(T (print "ERROR: wrong parameter name"))
        )
  )

; list of existential quantifiers
; each is represented by a list containg two elements:
; first: key describing  
; 'k = Ankathete    (A -> B)
; 'g = Gegenkathete (B -> C)
; 'h = Hypothenuse  (A -> C)
(defvar *lE*)
(setq *lE* '())
(defvar *tmp*)
(setq *tmp* '())

; REPLACETHIS
(defun r_exist (one two lr)
  (cond ((listp one)
  			(cond ((listp two) (mapcomb #'add one two lr '*tmp*))
  				  ((atom two) (mapsingle #'(lambda (a b l)
                                               (add b a (inverse l) '*tmp*)
                                               ) two one lr))
  			)
  		)
        ((atom one)
        	(cond ((listp two) (mapsingle #'add one two lr '*tmp*))
        		  ((atom two) (add one two lr '*tmp*))
        	)
        )
  )
  (setq *lE* (remove-if #'null (cons *tmp* *lE*)))
  (setq *tmp* '())
)

; Resets global variables to start another evaluation
(defun reset ()
  (setq *lE* '())
  (setq *lrs* '())
  (setq *tmp* '())
  (setq *extfile* '())
  (setq *violatingConditions* '())
  )
