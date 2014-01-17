(load "../code/file.lsp")
(load "../code/static.lsp")
(load "../code/quant.lsp")
(load "../code/util.lsp")
(load "../code/allen.lsp")

; set this to true if you want a quiet run (e.g. batch testing)
(defvar *noPrintViolatingConditionFlag*)
(setq *noPrintViolatingConditionFlag* '())

; main method
; evaluates rules in filename
(defun evaluate (filename)
	(LOAD_extfile filename)
	(map 'list #'eval (remove-if #'null *extfile*))
	(let ((result
			(cond
					((null *lE*) (test (keyvalue *lrs* 'k) (keyvalue *lrs* 'g) (keyvalue *lrs* 'h)))
					(T (reduce #'(lambda (a b) (or a b)) (map 'list #'testcombination (allexquantcombinations *lE*))))
		 )))
		(cond
			((and (not *noPrintViolatingConditionFlag*) *violatingConditions*) 
		       (print "Verletzende Bedingung/-en")
		       (print *violatingConditions*)
	   		)
	   	)
	   	result
	)
  )

; TODO verletzende Bedingung
