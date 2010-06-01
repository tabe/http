#!r6rs

(import (rnrs (6))
        (http header-field upgrade)
        (http assertion)
        (xunit))

(assert-parsing-successfully Upgrade
                             "Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11"
                             `(,(string->list "Upgrade")
                               #\:
                               (((#\H #\T #\T #\P) ((#\/ (#\2 #\. #\0))))
                                ((#\S #\H #\T #\T #\P) ((#\/ (#\1 #\. #\3))))
                                ((#\I #\R #\C) ((#\/ (#\6 #\. #\9))))
                                ((#\R #\T #\A) ((#\/ (#\x #\1 #\1)))))
                               ))

(report)
