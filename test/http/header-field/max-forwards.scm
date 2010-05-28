#!r6rs

(import (rnrs (6))
        (http header-field max-forwards)
        (http assertion)
        (xunit))

(assert-parsing-successfully Max-Forwards
                             "Max-Forwards: 10"
                             `(,(string->list "Max-Forwards")
                               #\:
                               (#\space)
                               ,(string->list "10")
                               ))

(report)
