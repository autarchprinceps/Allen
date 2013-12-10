(defvar *inverselist*)
(setq *inverselist* '((= =) (< >) (> <) (d di) (di d) (o oi) (oi o) (m mi) (mi m) (s i) (si s) (f fi) (fi f)))

(defun inverse (l)
    (cond
	((null l) '())
	(T (cons (keyvalue *inverselist* (car l)) (inverse (cdr l))))
    )
)


(defun keyvalue (l x)
  (cond
    ((null l) '())
    ((equal (car (car l)) x) (car (cdr (car l))))
    (T (keyvalue (cdr l) x))
    )
  )

(print (inverse '(= < > o)))
