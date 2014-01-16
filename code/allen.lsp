(defun inverse (l)
    (cond
	((null l) '())
	(T (cons (keyvalue *inverselist* (car l)) (inverse (cdr l))))
    )
)

; looks up the combination of a pair in the p-matrix
(defun combinepair (x y)
  (cond
    ((equal x '=) (list y))
    ((equal y '=) (list x))
    (T (keyvalue (keyvalue *pmatrix* x) y))
    )
  )

; REPLACETHIS
(defun combine (l m) (remove-duplicates (mapcomb #'combinepair l m)) )

; tests r for validity with the alternative path being the combination of l and m
(defun testsingle (l m r) (intersection (combine l m) r) )

; tests given relations for validity in all three directions
; a = Ankathete    (A -> B)
; g = Gegenkathete (B -> C)
; h = Hypothenuse  (A -> C)
(defun test (a g h)
  (and (testsingle a g h) (testsingle (inverse h) a (inverse g)) (testsingle g (inverse h) (inverse a)))
  )
