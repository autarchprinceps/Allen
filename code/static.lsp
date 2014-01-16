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


