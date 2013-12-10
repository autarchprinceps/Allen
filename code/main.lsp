(defvar *r*)
(setq *r* '(= < > d di o oi m mi s si f fi))

(defun isRelation (x)
  (cond ((member x *r*) T)))

(defvar *pmatrix*)
(setq *pmatrix* 
      '((< (= < > d di o oi m mi s si f fi) (< o m d s) < < (< o m d s) < (< o m d s) < < (< o m d s) <)
        ((= < > d di o oi m mi s si f fi) > (> oi mi d f) > (> oi mi d f)  > (> oi mi d f) > (> oi mi d f) > > >)
        (< > d (= < > d di o oi m mi s si f fi) (< o m d s) (> oi mi d f) < > d (> oi mi d f) d (< o m d s))
        ((< o m di fi) (< oi mi di si) (= d di o oi s si f fi) di (o di fi)(oi di si)
         (o di fi)(oi di si)(o di fi) di (oi di si) di)
        (< (> oi mi di si) (o d s) (< o m di fi) (< o m) (= d di o oi s si f fi) < (oi di si) o (di fi o) (d s o) (< o m))
        ((< o m di fi) > (oi d f) (< oi mi di si)(= d di o oi s si f fi)(> oi mi)(o di fi) > 
         (oi d f) (> oi mi) oi (oi di si))
        (< (> oi mi di si) (o d s) < < (o d s) < (= f fi) m m (d s o) <)
        ((< o m di fi) > (oi d f) > (oi d f) (= s si) > (d f oi) > mi mi)
        (< > d (< o m di fi) (< o m) (oi d f) < mi s (= s si) d (< o m))
        ((< o m di fi) > (oi d f) di (o di fi) oi (o di fi) mi (= s si) si oi di)
        (< > d (oi mi di si) (o d s) (> oi mi) m > d (> oi mi) f (= f fi))
        (< (> oi mi di si) (o d s) di o (oi di si) m (oi di si) o di (= f fi) fi)))
