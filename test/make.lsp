;load the main file
(load "../code/main.lsp")
(defvar *bug*)
(setq *bug* '())

; tests that should be successful
(if (evaluate "success/success01.lsp") (print "success01 ok") ((setq *bug* T) (print "success02 failed")))
(reset)
(if (evaluate "success/success02.lsp") (print "success02 ok") ((setq *bug* T) (print "success02 failed")))
(reset)
(if (evaluate "success/success03.lsp") (print "success03 ok") ((setq *bug* T) (print "success03 failed")))
(reset)
(if (evaluate "success/success04.lsp") (print "success04 ok") ((setq *bug* T) (print "success04 failed")))
(reset)


;tests that should fail:
(if (evaluate "fail/fail01.lsp")((setq *bug* T) (print "fail01 failed"))(print "fail01 ok"))
(reset)
(if (evaluate "fail/fail02.lsp")((setq *bug* T) (print "fail02 failed"))(print "fail02 ok"))
(reset)
(if (evaluate "fail/fail03.lsp")((setq *bug* T) (print "fail03 failed"))(print "fail03 ok"))
(reset)
(if (evaluate "fail/fail04.lsp")((setq *bug* T) (print "fail04 failed"))(print "fail04 ok"))
(reset)
(if (evaluate "fail/fail05.lsp")((setq *bug* T) (print "fail05 failed"))(print "fail05 ok"))
(reset)

(if *bug* (print "There are still bugs.") (print "All tests have returned the expected result."))
