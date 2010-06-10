#!r6rs

(import (rnrs (6))
        (http header-field from)
        (http assertion)
        (xunit))

(assert-parsing-successfully From
                             "From: webmaster@w3.org"
                             `(,(string->list "From")
                               #\:
                               (#\space)
                               ,(map char->integer (string->list "webmaster@w3.org"))
                               ))

(report)
