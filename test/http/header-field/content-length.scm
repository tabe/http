#!r6rs

(import (rnrs (6))
        (http header-field content-length)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-Length
                             "Content-Length: 3495"
                             `(,(string->list "Content-Length")
                               #\:
                               (#\space)
                               ,(string->list "3495")))

(report)
