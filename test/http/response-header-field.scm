#!r6rs

(import (rnrs (6))
        (http response-header-field)
        (http assertion)
        (xunit))

(assert-parsing-successfully response-header
                             "Server: foo"
                             `(,(string->list "Server")
                               #\:
                               (((#\space) ((#\f #\o #\o) ())))
                               ))

(report)
