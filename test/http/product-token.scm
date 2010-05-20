#!r6rs

(import (rnrs (6))
        (http product-token)
        (http assertion)
        (xunit))

(assert-parsing-successfully product
                             "CERN-LineMode/2.15"
                             `(,(string->list "CERN-LineMode") ((#\/ ,(string->list "2.15")))))
(assert-parsing-successfully product
                             "libwww/2.17b3"
                             `(,(string->list "libwww") ((#\/ ,(string->list "2.17b3")))))
(assert-parsing-successfully product
                             "Apache/0.8.4"
                             `(,(string->list "Apache") ((#\/ ,(string->list "0.8.4")))))

(report)
