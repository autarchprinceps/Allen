(defvar *r*)
(setq *r* '(= < > d di o oi m mi s si f fi))

(defun isRelation (x)
  (cond ((member x *r*) T)))

(defvar *pmatrix*)
(setq *pmatrix* 
      '(
        (< ( (< (<)) (> (= < > d di o oi m mi s si fi)) (d (<)) (di (< o m di fi)) (o (<)) (oi (< o m di fi)) (m (<)) (mi (< o m di fi)) (s (<)) (si (< o m di fi)) (f (<)) (fi (<)) ))
        (> ( (< (= < > d di o oi m mi s si f fi)) (> (>)) (d (>)) (di (< oi mi di si)) (o (> oi mi di si)) (oi (>)) (m (> oi mi di si)) (mi (>)) (s (>)) (si (>)) (f (>)) (fi (> oi mi di si)) ))
        (d ( (< (< o md s)) (> (> oi mi d f)) (d (d)) (di (= d di o oi s si f fi)) (o (o d s)) (oi (oi d f)) (m (o d s)) (mi (oi d f)) (s (d)) (si (oi d f)) (f (d)) (fi (> oi mi di si)) ))
        (di ())
        (o ())
        (oi ())
        (m ())
        (mi ())
        (s ())
        (si ())
        (f ())
        (fi ())
        )
      )

(defun setify (l)
  (cond
        ((null l) '())
        (T (cond
            ((member (car l) (cdr l)) (makeset (cdr l)))
            (T (cons (car l) (makeset (cdr l))))
            )
           )
        )
  )

(defun keyvalue (l x)
  (cond
    ((null l) '())
    ((equals (car (car l)) x) (cdr (car l)))
    (T (keyvalue (cdr l) x))
    )
  )

(defun combinepair (x y)
  (cond
    ((equal x =) (list y))
    ((equal y =) (list x))
    (T ())
    )
  )

(defun mapsingle (func x l)
  (cond
    ((null l) '())
    (T (cons (func x (car l)) (mapsingle func x (cdr l))))
    )
  )

(defun mapcomb (func l m)
  (cond
    ((null l) '())
    (T (append (mapsingle func (car l) m) (mapcomb func (cdr l) m)))
    )
  )

(defun combine (l m)
  (setify (mapcomb 'combinepair l m))
  )
