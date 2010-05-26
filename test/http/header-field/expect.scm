#!r6rs

(import (rnrs (6))
        (http header-field expect)
        (http assertion)
        (xunit))

(assert-parsing-successfully Expect
                             "Expect: 100-continue"
                             `(,(string->list "Expect")
                               #\:
                               (,(string->list "100-continue"))
                               ))
(assert-parsing-successfully Expect
                             "Expect: abc,foo=bar;baz"
                             `(,(string->list "Expect")
                               #\:
                               (((#\a #\b #\c) ())
                                ((#\f #\o #\o) ((#\= (#\b #\a #\r) ((#\; () (#\b #\a #\z) ()))))))
                               ))

(report)
