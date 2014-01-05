; Brauchen wir das?
;(defvar *r*)
;(setq *r* '(= < > d di o oi m mi s si f fi))
;
;(defun isRelation (x)
;  (cond ((member x *r*) T)))

; die korrigierte P-Matrix
(defvar *pmatrix*)
(setq *pmatrix* 
      '(
        (< ( (< (<)) (> (= < > d di o oi m mi s si f fi)) (d (< o m d s)) (di (<)) (o (<)) (oi (< o m d s)) (m (<)) (mi (< o m d s)) (s (<)) (si (<)) (f (< o m d s)) (fi (<)) ))
        (> ( (< (= < > d di o oi m mi s si f fi)) (> (>)) (d (> oi mi d f)) (di (>)) (o (> oi mi d f)) (oi (>)) (m (> oi mi d f)) (mi (>)) (s (> oi mi d f)) (si (>)) (f (>)) (fi (>)) ))
        (d ( (< (<)) (> (>)) (d (d)) (di (= < > d di o oi m mi s si f fi)) (o (< o m d s)) (oi (> oi mi d f)) (m (<)) (mi (>)) (s (d)) (si (> oi mi d f)) (f (d)) (fi (< o m d s)) ))
        (di ( (< (< o m di fi)) (> (< oi mi di si)) (d (= d di o oi s si f fi)) (di (di)) (o (o di fi)) (oi (oi di si)) (m (o di fi)) (mi (oi di si)) (s (o di fi)) (si (di)) (f (oi di si)) (fi (di)) ))
        (o ( (< (<)) (> (> oi mi di si)) (d (o d s)) (di (< o m di fi)) (o (< o m)) (oi (= d di o oi s si f fi)) (m (<)) (mi (oi di si)) (s (o)) (si (di fi o)) (f (d s o)) (fi (< o m)) ))
        (oi ( (< (< o m di fi)) (> (>)) (d (oi d f)) (di (< oi mi di si)) (o (= d di o oi s si f fi)) (oi (> oi mi)) (m (o di fi)) (mi (>)) (s (oi d f)) (si (> oi mi)) (f (oi)) (fi (oi di si)) ))
        (m ( (< (<)) (> (> oi mi di si)) (d (o d s)) (di (<)) (o (<)) (oi (o d s)) (m (<)) (mi (= f fi)) (s (m)) (si (m)) (f (d s o)) (fi (<)) ))
        (mi ( (< (< o m di fi)) (> (>)) (d (oi d f)) (di (>)) (o (oi d f)) (oi (>)) (m (= s si)) (mi (>)) (s (d f oi)) (si (>)) (f (mi)) (fi (mi)) ))
        (s ( (< (<)) (> (>)) (d (d)) (di (< o m di fi)) (o (< o m)) (oi (oi d f)) (m (<)) (mi (mi)) (s (s)) (si (= s si)) (f (d)) (fi (< o m)) ))
        (si ( (< (< o m di fi)) (> (>)) (d (oi d f)) (di (di)) (o (o di fi)) (oi (oi)) (m (o di fi)) (mi (mi)) (s (= s si)) (si (si)) (f (oi)) (fi (di)) ))
        (f ( (< (<)) (> (>)) (d (d)) (di (> oi mi di si)) (o (o d s)) (oi (> oi mi)) (m (m)) (mi (>)) (s (d)) (si (> oi mi)) (f (f)) (fi (= f fi)) ))
        (fi ( (< (<)) (> (> oi mi di si)) (d (o d s)) (di (di)) (o (o)) (oi (oi di si)) (m (m)) (mi (oi di si)) (s (o)) (si (di)) (f (= f fi)) (fi (fi)) ))
        )
      )

; Die urspruengliche P-Matrix
;(setq *pmatrix* 
;      '(
;        (< ( (< (<)) (> (= < > d di o oi m mi s si fi)) (d (<)) (di (< o m di fi)) (o (<)) (oi (< o m di fi)) (m (<)) (mi (< o m di fi)) (s (<)) (si (< o m di fi)) (f (<)) (fi (<)) ))
;        (> ( (< (= < > d di o oi m mi s si f fi)) (> (>)) (d (>)) (di (< oi mi di si)) (o (> oi mi di si)) (oi (>)) (m (> oi mi di si)) (mi (>)) (s (>)) (si (>)) (f (>)) (fi (> oi mi di si)) ))
;        (d ( (< (< o md s)) (> (> oi mi d f)) (d (d)) (di (= d di o oi s si f fi)) (o (o d s)) (oi (oi d f)) (m (o d s)) (mi (oi d f)) (s (d)) (si (oi d f)) (f (d)) (fi (> oi mi di si)) ))
;        (di ( (< (<)) (> (>)) (d (= < > d di o oi m mi s si f fi)) (di (di)) (o (< o m di fi)) (oi (< oi mi di si)) (m (<)) (mi (>)) (s (< o m di fi)) (si (di)) (f (> oi mi di si)) (fi (di)) ))
;        (o ( (< (<)) (> (> oi mi d f)) (d (< o m d s)) (di (o di fi)) (o (< o m)) (oi (= d di o oi s si f fi)) (m (<)) (mi (oi d f)) (s (< o m)) (si (o di fi)) (f (o d s)) (fi (o)) ))
;        (oi ( (< (< o m d s)) (> (>)) (d (> oi mi d f)) (di (oi di si)) (o (= d di o oi s si f fi)) (oi (> oi mi)) (m (o d s)) (mi (>)) (s (oi d f)) (si (oi)) (f (> oi mi)) (fi (oi di si)) ))
;        (m ( (< (<)) (> (> oi mi d f)) (d (<)) (di (o di fi)) (o (<)) (oi (o di fi)) (m (<)) (mi (= s si)) (s (<)) (si (o di fi)) (f (m)) (fi (m)) ))
;        (mi ( (< (< o m d s)) (> (>)) (d (>)) (di (oi di si)) (o (oi di si)) (oi (>)) (m (= f fi)) (mi (>)) (s (mi)) (si (mi)) (f (>)) (fi (oi di si)) ))
;        (s ( (< (<)) (> (> oi mi d f)) (d (d)) (di (o di fi)) (o (o)) (oi (oi d f)) (m (m)) (mi (d f oi)) (s (s)) (si (= s si)) (f (d)) (fi (o)) ))
;        (si ( (< (<)) (> (>)) (d (> oi mi d f)) (di (di)) (o (di fi o)) (oi (> oi mi)) (m (m)) (mi (>)) (s (= s si)) (si (si)) (f (> oi mi)) (fi (di)) ))
;        (f ( (< (< o m d s)) (> (>)) (d (d)) (di (oi di si)) (o (d s o)) (oi (oi)) (m (d s o)) (mi (mi)) (s (d)) (si (oi)) (f (f)) (fi (= f fi)) ))
;        (fi ( (< (<)) (> (>)) (d (< o m d s)) (di (di)) (o (o)) (oi (oi di si)) (m (<)) (mi (mi)) (s (< o m)) (si (di)) (f (= f fi)) (fi (fi)) ))
;        )
;      )





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

(defun combine (l m) (remove-duplicates (mapcomb #'combinepair l m)) )

(defun testsingle (l m r) (intersection (combine l m) r) )

(defun test (a g h)
  (if (and (testsingle a g h) (testsingle (inverse h) a (inverse g)) (testsingle g (inverse h) a)) T '())
  )

(print (combine '(< >) '(m o)))
(print (test '(<) '(=) '(>)))
(print (test '(< >) '(= o) '(<)))

(print (test '(=) '(fi) '(fi))) ;true

(print (combine '(fi) '(=))) ; (fi)
(print (test '(fi) '(=) '(fi))) ; hier kommt ein falsches Ergebnis raus!

(print (combine '(d) '(=))) ; (d)
(print (test '(d) '(=) '(d))) ; hier kommt ein falsches Ergebnis raus!

(print (combine '(< = m) '(oi m fi))) ; von Hand berechnet und doppelt gecheckt soll sein (< o m d s oi fi)
(print (test '(< = m) '(oi m fi) '(< o m d s oi fi))) ; true, und die Berechnung von Hand stimmt hiermit überein

(print (combine '(fi = >) '(o mi f))) ; von Hand berechnet: (o oi di si f mi > d)
(print (test '(fi = >) '(o mi f) '(o oi di si f mi > d))) ; true, und die Berechnung von Hand stimmt hiermit überein

(print (combine '(fi = >) '(< = m))) ; von Hand berechnet: (= < > d di o oi m mi s si f fi)
(print (test '(fi = >) '(< = m) '(= < > d di o oi m mi s si f fi)))

(print (combine '(fi) '(o))) ; is (o)
(print (test '(fi) '(o) '(o))) ; should be true
