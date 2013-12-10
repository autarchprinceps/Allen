(defvar *inverselist*)
(setq *inverselist* ''((= =) (< >) (> <) (d di) (di d) (o oi) (oi o) (m mi) (mi m) (s i) (si s) (f fi) (fi f)))
	
(defun lookup (x)(
	(loop
		(setq m (CAR *inverselist*))
		(cond (EQUAL x (CAR m))(CDR m))
	)
)

(defun inverse (l)
	(map 'list 'lookup l)
)