(defun mapsingle (func x l)
  (cond
    ((null l) '())
    (T (append (funcall func x (car l)) (mapsingle func x (cdr l))))
    )
  )
(defun mapcomb (func l m)
  (cond
    ((null l) '())
    (T (append (mapsingle func (car l) m) (mapcomb func (cdr l) m)))
    )
  )
; encases cons with list 
(defun wrappedcons (e l)
  (list (cons e l))
  )
(defun power (l)
  (remove-if #'null (reduce #'(lambda (i ps)
              (append (map 'list #'(lambda (e)
                                     (cons i e)
                                     )
                           ps
                           )
                      ps
                      )
              ) l :from-end t :initial-value '(())))
  )

(defun allexquantcombinations (l)
  (cond
    ((null l) '())
    (T (mapcomb #'wrappedcons (power (car l)) (allexquantcombinations (cdr l))))
    )
  )
(print (power '(1 2 3)))
(print (allexquantcombinations '((7 8))))
(print (allexquantcombinations '((1 2 3) '(7 8))))
(print (allexquantcombinations '((1 2 3) (4 5) (6) (7 8))))
