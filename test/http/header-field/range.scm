#!r6rs

(import (rnrs (6))
        (http header-field range)
        (http assertion)
        (xunit))

(assert-parsing-successfully Range
                             "Range: bytes=500-600,601-999"
                             `(,(string->list "Range")
                               #\:
                               (#\space)
                               (,(string->list "bytes") #\= ((,(string->list "500") #\- (,(string->list "600"))) (,(string->list "601") #\- (,(string->list "999")))))
                               ))

(report)
