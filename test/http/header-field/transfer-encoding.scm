#!r6rs

(import (rnrs (6))
        (http header-field transfer-encoding)
        (http assertion)
        (xunit))

(assert-parsing-successfully Transfer-Encoding
                             "Transfer-Encoding: chunked"
                             `(,(string->list "Transfer-Encoding")
                               #\:
                               (,(string->list "chunked"))
                               ))

(report)
