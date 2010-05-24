#!r6rs

(import (rnrs (6))
        (http header-field content-encoding)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-Encoding
                             "Content-Encoding: gzip"
                             `(,(string->list "Content-Encoding")
                               #\:
                               (,(string->list "gzip"))))

(report)
