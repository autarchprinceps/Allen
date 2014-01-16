; searches for list in l with first element / key = x and returns cdr / value of it
(defun keyvalue (l x)
  (cond
    ((null l) '())
    ((equal (caar l) x) (cadar l))
    (T (keyvalue (cdr l) x))
    )
  )
  
; maps function func over list l with single static parameter x
(defun mapsingle (func x l &optional p1 p2)
  (cond
    ((null l) '())
    (T (append (if (and (null p1) (null p2)) (funcall func x (car l)) (funcall func x (car l) p1 p2)) (mapsingle func x (cdr l) p1 p2)))
    )
  )
  
; maps function func over all possible combinations of one element out of each list l and list m
(defun mapcomb (func l m &optional p1 p2)
  (cond
    ((null l) '())
    (T (append (mapsingle func (car l) m p1 p2) (mapcomb func (cdr l) m p1 p2)))
    )
  )
  
; returns cdr/value of list l if first element is key
(defun keyvaluetester (key l)
  (cond
    ((equal key (car l)) (cdr l))
    (T '())
    )
  )
