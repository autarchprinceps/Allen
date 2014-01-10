;load the main file
(load "../code/main.lsp")

; tests that should be successful
(if (evaluate "success/test01.lsp") (print "test1 ok")(print "test1 failed"))

(reset)

;tests that should fail:
(if (evaluate "fail/test01.lsp")(print "test1 failed")(print "test1 ok"))
