#!r6rs

(import (rnrs (6))
        (http header-field connection)
        (http assertion)
        (xunit))

(assert-parsing-successfully Connection
                             "Connection: close"
                             `(,(string->list "Connection")
                               #\:
                               (,(string->list "close"))))

(report)
