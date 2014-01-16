; returns the power set of l (except for empty list)
(defun power (l)
  (remove-if #'null (reduce #'(lambda (i ps)
              (append (map 'list #'(lambda (e) (cons i e)) ps) ps)
        ) l :from-end t :initial-value '(())))
  )
  
; returns list of all possibilities when combining the existential quantifiers
(defun allexquantcombinations (l)
  (cond
    ((null l) '())
    ((equal (length l) 1) (power (car l)))
    (T (mapcomb #'(lambda (a b) (list (append a b))) (power (car l)) (allexquantcombinations (cdr l))))
    )
  )
  
; applies keyvaluetester to all lists within a list of lists
; returns list of all cdrs/values of lists with first element = key
(defun keyvalues (l key) (mapsingle #'keyvaluetester key l))

; returns set union of list s and list of lists l
(defun onion (s l)
  (remove-duplicates (append s (reduce #'append l)))
  )
  
; tests validity of a single combination of possibilities of all existential quantifiers with fixed necessary conditions stored in *lrs*
(defun testcombination (combination)
  (test (onion (keyvalue *lrs* 'k) (keyvalues combination 'k)) (onion (keyvalue *lrs* 'g) (keyvalues combination 'g)) (onion (keyvalue *lrs* 'h) (keyvalues combination 'h)))
  )
