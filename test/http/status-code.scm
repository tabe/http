#!r6rs

(import (rnrs (6))
        (http status-code)
        (http assertion)
        (xunit))

(assert-parsing-successfully Status-Code "404")

(assert-parsing-successfully Reason-Phrase "")
(assert-parsing-successfully Reason-Phrase
                             "Not Found"
                             (map (lambda (c) `(ctext ,c)) (string->list "Not Found")))

(report)
