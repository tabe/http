#!r6rs

(import (rnrs (6))
        (http header-field trailer)
        (http assertion)
        (xunit))

(assert-parsing-successfully Trailer
                             "Trailer: foo,bar"
                             `(,(string->list "Trailer")
                               #\:
                               (,(string->list "foo")
                                ,(string->list "bar"))
                               ))

(report)
