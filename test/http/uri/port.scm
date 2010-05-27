#!r6rs

(import (rnrs (6))
        (http uri port)
        (http assertion)
        (xunit))

(assert-parsing-successfully port "")
(assert-parsing-successfully port "80")
(assert-parsing-successfully port "443")

(report)
