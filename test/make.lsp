;load the main file
(load "../code/main.lsp")

; tests that should be successful
(if (evaluate "success/success01.lsp") (print "success01 ok")(print "success02 failed"))
(reset)
(if (evaluate "success/success02.lsp") (print "success02 ok")(print "success02 failed"))
(reset)
(if (evaluate "success/success03.lsp") (print "success03 ok")(print "success03 failed"))
(reset)
(if (evaluate "success/success04.lsp") (print "success04 ok")(print "success04 failed"))
(reset)


;tests that should fail:
(if (evaluate "fail/fail01.lsp")(print "fail01 failed")(print "fail01 ok"))
(reset)
(if (evaluate "fail/fail02.lsp")(print "fail02 failed")(print "fail02 ok"))
(reset)
(if (evaluate "fail/fail03.lsp")(print "fail03 failed")(print "fail03 ok"))
(reset)
(if (evaluate "fail/fail04.lsp")(print "fail04 failed")(print "fail04 ok"))
(reset)
(if (evaluate "fail/fail05.lsp")(print "fail05 failed")(print "fail05 ok"))
(reset)
