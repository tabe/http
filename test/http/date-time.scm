#!r6rs

(import (rnrs (6))
        (only (http stream) port->stream)
        (http date-time)
        (xunit))

(define-syntax assert-parsing-successfully
  (syntax-rules ()
    ((_ name str)
     (assert-parsing-successfully name str (string->list str)))
    ((_ name str expected-tree)
     (assert-parsing-successfully name str (reverse (string->list str)) expected-tree))
    ((_ name str expected-head expected-tree)
     (name
      (port->stream (open-string-input-port str))
      (lambda _
        (fail! "assert-parsing-successfully failed"))
      (lambda (head tree)
        (assert-equal? expected-head head)
        (assert-equal? expected-tree tree))))))

(assert-parsing-successfully HTTP-date
                             "Sun, 06 Nov 1994 08:49:37 GMT"
                             '((#\S #\u #\n) #\, #\space ((#\0 #\6) #\space (#\N #\o #\v) #\space (#\1 #\9 #\9 #\4)) #\space ((#\0 #\8) #\: (#\4 #\9) #\: (#\3 #\7)) #\space (#\G #\M #\T)))
(assert-parsing-successfully HTTP-date
                             "Sunday, 06-Nov-94 08:49:37 GMT"
                             '((#\S #\u #\n #\d #\a #\y) #\, #\space ((#\0 #\6) #\- (#\N #\o #\v) #\- (#\9 #\4)) #\space ((#\0 #\8) #\: (#\4 #\9) #\: (#\3 #\7)) #\space (#\G #\M #\T)))
(assert-parsing-successfully HTTP-date
                             "Sun Nov  6 08:49:37 1994"
                             '((#\S #\u #\n) #\space ((#\N #\o #\v) #\space (#\space (#\6))) #\space ((#\0 #\8) #\: (#\4 #\9) #\: (#\3 #\7)) #\space (#\1 #\9 #\9 #\4)))

(report)
