(load "../code/file.lsp")
(load "../code/static.lsp")
(load "../code/quant.lsp")
(load "../code/util.lsp")
(load "../code/allen.lsp")

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

; TODO verletzende Bedingung
