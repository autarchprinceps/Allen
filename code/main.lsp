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
        (di ( (< (<)) (> (>)) (d (= < > d di o oi m mi s si f fi)) (di (di)) (o (< o m di fi)) (oi (< oi mi di si)) (m (<)) (mi (>)) (s (< o m di fi)) (si (di)) (f (> oi mi di si)) (fi (di)) ))
        (o ( (< (<)) (> (> oi mi d f)) (d (< o m d s)) (di (o di fi)) (o (< o m)) (oi (= d di o oi s si f fi)) (m (<)) (mi (oi d f)) (s (< o m)) (si (o di fi)) (f (o d s)) (fi (o)) ))
        (oi ( (< (< o m d s)) (> (>)) (d (> oi mi d f)) (di (oi di si)) (o (= d di o oi s si f fi)) (oi (> oi mi)) (m (o d s)) (mi (>)) (s (oi d f)) (si (oi)) (f (> oi mi)) (fi (oi di si)) ))
        (m ( (< (<)) (> (> oi mi d f)) (d (<)) (di (o di fi)) (o (<)) (oi (o di fi)) (m (<)) (mi (= s si)) (s (<)) (si (o di fi)) (f (m)) (fi (m)) ))
        (mi ( (< (< o m d s)) (> (>)) (d (>)) (di (oi di si)) (o (oi di si)) (oi (>)) (m (= f fi)) (mi (>)) (s (mi)) (si (mi)) (f (>)) (fi (oi di si)) ))
        (s ( (< (<)) (> (> oi mi d f)) (d (d)) (di (o di fi)) (o (o)) (oi (oi d f)) (m (m)) (mi (d f oi)) (s (s)) (si (= s si)) (f (d)) (fi (o)) ))
        (si ( (< (<)) (> (>)) (d (> oi mi d f)) (di (di)) (o (di fi o)) (oi (> oi mi)) (m (m)) (mi (>)) (s (= s si)) (si (si)) (f (> oi mi)) (fi (di)) ))
        (f ( (< (< o m d s)) (> (>)) (d (d)) (di (oi di si)) (o (d s o)) (oi (oi)) (m (d s o)) (mi (mi)) (s (d)) (si (oi)) (f (f)) (fi (= f fi)) ))
        (fi ( (< (<)) (> (>)) (d (< o m d s)) (di (di)) (o (< o m)) (oi (oi di si)) (m (<)) (mi (mi)) (s (< o m)) (si (di)) (f (= f fi)) (fi (fi)) ))
        )
      )

(defun keyvalue (l x)
  (cond
    ((null l) '())
    ((equal (car (car l)) x) (car (cdr (car l))))
    (T (keyvalue (cdr l) x))
    )
  )

(defun combinepair (x y)
  (cond
    ((equal x '=) (list y))
    ((equal y '=) (list x))
    (T (keyvalue (keyvalue *pmatrix* x) y))
    )
  )

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

(defun combine (l m)
  (remove-duplicates (mapcomb #'combinepair l m))
  )

(print (combine '(< >) '(= <)))
