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

(defvar *inverselist*)
(setq *inverselist* '((= =) (< >) (> <) (d di) (di d) (o oi) (oi o) (m mi) (mi m) (s si) (si s) (f fi) (fi f)))

(defun inverse (l)
    (cond
	((null l) '())
	(T (cons (keyvalue *inverselist* (car l)) (inverse (cdr l))))
    )
)

(defun keyvalue (l x)
  (cond
    ((null l) '())
    ((equal (caar l) x) (cadar l))
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
  (if (and (testsingle a g h) (testsingle (inverse h) a (inverse g)) (testsingle g (inverse h) (inverse a))) T '())
  )
(print (keyvalue *pmatrix* '<))
(print (combine '(< >) '(m o)))
(print (test '(<) '(=) '(>)))
(print (test '(< >) '(= o) '(<)))

(print (test '(=) '(fi) '(fi))) ;true

(print (combine '(fi) '(=))) ; (fi)
(print (test '(fi) '(=) '(fi)))
(print (testsingle '(fi) '(=) '(fi)))

(print (combine '(d) '(=))) ; (d)
(print (test '(d) '(=) '(d)))

(print (combine '(< = m) '(oi m fi))) ; von Hand berechnet und doppelt gecheckt soll sein (< o m d s oi fi)
(print (test '(< = m) '(oi m fi) '(< o m d s oi fi))) ; true, und die Berechnung von Hand stimmt hiermit überein

(print (combine '(fi = >) '(o mi f))) ; von Hand berechnet: (o oi di si f mi > d)
(print (test '(fi = >) '(o mi f) '(o oi di si f mi > d))) ; true, und die Berechnung von Hand stimmt hiermit überein

(print (combine '(fi = >) '(< = m))) ; von Hand berechnet: (= < > d di o oi m mi s si f fi)
(print (test '(fi = >) '(< = m) '(= < > d di o oi m mi s si f fi)))

(print (combine '(fi) '(o))) ; is (o)
(print (test '(fi) '(o) '(o))) ; should be true

(print "Tests:")
(print (test '(<) '(<) '(>))) ; should be false
(print "false")
(print (test '(=) '(>) '(fi < mi)))
(print "false")
(print (test '(d m) '(o m) '(< o m d s)))
(print T)
(print (test '(d m) '(o m) '(> = oi mi di si fi f)))
(print "false")
(print (inverse '(= < > m mi o oi s si f fi d di)))
(print '(= > < mi m oi o si s fi f di d))

; read from file
(defvar *lrs*)
(setq *lrs* '())
(defun r (one two lr)
	(add one two lr '*lrs*)
)
(print "DEBUG: After r")
(defun add (one two lr globalselector)
  (cond ((equal one 'A)
         (cond ((equal two 'B) (setq (eval globalselector) (cons (list 'a lr) (eval globalselector))))
               ((equal two 'C) (setq (eval globalselector) (cons (list 'h lr) (eval globalselector))))
               (T (print "ERROR: wrong parameter name"))
               )
         )
        ((equal one 'B)
         (cond ((equal two 'A) (setq (eval globalselector) (cons (list 'a (inverse lr)) (eval globalselector))))
               ((equal two 'C) (setq (eval globalselector) (cons (list 'g lr) (eval globalselector))))
               (T (print "ERROR: wrong parameter name"))
               )
         )
        ((equal one 'C)
         (cond ((equal two 'A) (setq (eval globalselector) (cons (list 'h (inverse lr)) (eval globalselector))))
               ((equal two 'B) (setq (eval globalselector) (cons (list 'g (inverse lr)) (eval globalselector))))
               (T (print "ERROR: wrong parameter name"))
               )
         )
        (T (print "ERROR: wrong parameter name"))
        )
  )
(print "DEBUG: After add")
(defun addi (one two lr) (add two one (inverse lr)))
(print "DEBUG: After addi")
; Liste von Existenzquantor (je eine Hashmap a,g,h -> lr)
(defvar *lE*)
(setq *lE* '())
(print "DEBUG: After *1E*")

(defun mapsingle2p (func x l p1 p2)
  (cond
    ((null l) '())
    (T (append (funcall func x (car l) p1 p2) (mapsingle func x (cdr l) p1 p2)))
    )
  )

(defun mapcomb2p (func l m p1 p2)
  (cond
    ((null l) '())
    (T (append (mapsingle func (car l) m p1 p2) (mapcomb func (cdr l) m p1 p2)))
    )
  )

(defun r_exists (one two lr)
  (cond ((list one)
  			(cond ((list two) (mapcomb2p #'add one two lr '*lE*))
  				  ((atom two) (mapsingle2p #'addi two one lr '*1E*))
  			)
  		)
        ((atom one)
        	(cond ((list two) (mapsingle2p #'add one two lr '*lE*))
        		  ((atom two) (add one two lr '*1E*))
        	)
        )
  )
)
(print "DEBUG: After r_exists")
; existenzquantortestimplementierung

(defun evaluate (filename)
 (readandload filename)
 (reduce #'or (map 'list #'testcombination (allexquantcombinations *1E*)))
  )
(defun wrappedcons (e l)
  (list (cons e l))
  )

(defun scomb (l e)
  (cond
    ((null l)
     (list (list e))
     )
    (T
     (mapsingle #'wrappedcons e l)
     )
    )
  )
(defun allexquantcombinations (l)
  (cond
    ((null l) '())
    (T (mapsingle #'scomb (allexquantcombinations (cdr l)) (car l)))
    )
  )
(defun keyvaluetester (key l)
  (cond
    ((equal key (car l)) (cdr l))
    (T '())
    )
  )
(defun keyvalues (l key) (mapsingle #'keyvaluetester key l))
(defun testcombination (combination)
  (test (onion (keyvalue *lrs* 'a) (keyvalues combination 'a)) (onion (keyvalue *lrs* 'g) (keyvalues combination)))
  )

; TODO optional parameters statt mapcomb2p mapsingle2p
; TODO allexquantcombinations nicht E! sondern E
