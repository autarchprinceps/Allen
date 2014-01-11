;load the main file
(load "../code/main.lsp")

; tests that should be successful
(if (evaluate "success/success01.lsp") (print "success1 ok")(print "success1 failed"))
(reset)

;tests that should fail:
(if (evaluate "fail/fail01.lsp")(print "fail1 failed")(print "fail1 ok"))
(reset)
(if (evaluate "fail/fail02.lsp")(print "fail2 failed")(print "fail2 ok"))
(reset)
