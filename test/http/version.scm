#!r6rs

(import (rnrs (6))
        (only (http stream) port->stream)
        (http version)
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

(assert-parsing-successfully HTTP-Version "HTTP/1.0" '((#\H #\T #\T #\P #\/) (#\1) #\. (#\0)))
(assert-parsing-successfully HTTP-Version "HTTP/1.1" '((#\H #\T #\T #\P #\/) (#\1) #\. (#\1)))
(assert-parsing-successfully HTTP-Version "HTTP/12.31" '((#\H #\T #\T #\P #\/) (#\1 #\2) #\. (#\3 #\1)))

(report)
