#!r6rs

(import (rnrs (6))
        (http uri scheme)
        (http assertion)
        (xunit))

(assert-parsing-successfully scheme "http" `(#\h ,(string->list "ttp")))
(assert-parsing-successfully scheme "https" `(#\h ,(string->list "ttps")))

(report)
