(load "../code/file.lsp")
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
; searches for list in l with first element / key = x and returns cdr / value of it
(defun keyvalue (l x)
  (cond
    ((null l) '())
    ((equal (caar l) x) (cadar l))
    (T (keyvalue (cdr l) x))
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
; Tests:
#|(print (keyvalue *pmatrix* '<))
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
|#
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
; Liste von Existenzquantor (je eine Hashmap a,g,h -> lr)
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
; sets global variable
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
; REPLACETHIS
(defun reset ()
  (setq *lE* '())
  (setq *lrs* '())
  (setq *tmp* '())
  (setq *extfile* '())
  )
; main method
; evaluates rules in filename
(defun evaluate (filename)
	(LOAD_extfile filename)
	(map 'list #'eval (remove-if #'null *extfile*))
    (print "Evaluate")
    (print *lrs*)
    (print *lE*)
	(cond
		((null *lE*) (test (keyvalue *lrs* 'k) (keyvalue *lrs* 'g) (keyvalue *lrs* 'h)))
		(T (reduce #'(lambda (a b) (or a b)) (map 'list #'testcombination (allexquantcombinations *lE*))))
	)
  )
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
; returns cdr/value of list l if first element is key
(defun keyvaluetester (key l)
  (cond
    ((equal key (car l)) (cdr l))
    (T '())
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
; TODO verletzende Bedingung
