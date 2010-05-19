#!r6rs

(import (rnrs (6))
        (only (http stream) port->stream)
        (http basic-rule)
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

(assert-parsing-successfully token "foo")
(assert-parsing-successfully token "This_is_a-t0ken")

(assert-parsing-successfully ctext "a" '(ctext #\a))
(assert-parsing-successfully ctext "\r\n " '(#\space) '(ctext #\space))
(assert-parsing-successfully ctext "\r\n \t" '(#\space) '(ctext #\space))
(assert-parsing-successfully ctext "\r\n\t " '(#\tab) '(ctext #\tab))

(assert-parsing-successfully quoted-pair "\\a" '(quoted-pair #\a))
(assert-parsing-successfully quoted-pair "\\\\" '(quoted-pair #\\))
(assert-parsing-successfully quoted-pair "\\\"" '(quoted-pair #\"))

(assert-parsing-successfully comment "()" '(comment))
(assert-parsing-successfully comment "(foo)" '(comment (ctext #\f) (ctext #\o) (ctext #\o)))
(assert-parsing-successfully comment "(\\(\\))" '(comment (quoted-pair #\() (quoted-pair #\))))
(assert-parsing-successfully comment "(())" '(comment (comment)))

(assert-parsing-successfully quoted-string "\"\\\"\\\"\"" '(#\" ((quoted-pair #\") (quoted-pair #\")) #\"))

(report)
