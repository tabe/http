#!r6rs

(import (rnrs (6))
        (http header-field pragma)
        (http assertion)
        (xunit))

(assert-parsing-successfully Pragma
                             "Pragma: no-cache"
                             `(,(string->list "Pragma")
                               #\:
                               (,(string->list "no-cache"))
                               ))
(assert-parsing-successfully Pragma
                             "Pragma: foo,bar=\"baz\""
                             `(,(string->list "Pragma")
                               #\:
                               (((#\f #\o #\o) ())
                                ((#\b #\a #\r) ((#\= (#\" ((ctext #\b) (ctext #\a) (ctext #\z)) #\")))))
                               ))

(report)
