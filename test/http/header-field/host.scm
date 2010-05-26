#!r6rs

(import (rnrs (6))
        (http header-field host)
        (http assertion)
        (xunit))

(assert-parsing-successfully Host
                             "Host: www.w3.org"
                             `(,(string->list "Host")
                               #\:
                               (#\space)
                               (#\w #\w #\w #\. #\w #\3 #\. #\o #\r #\g)
                               ()
                               ))

(report)
