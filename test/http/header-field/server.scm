#!r6rs

(import (rnrs (6))
        (http header-field server)
        (http assertion)
        (xunit))

(assert-parsing-successfully Server
                             "Server: CERN/3.0 libwww/2.17"
                             `(,(string->list "Server")
                               #\:
                               (((#\space) ((#\C #\E #\R #\N) ((#\/ (#\3 #\. #\0)))))
                                ((#\space) ((#\l #\i #\b #\w #\w #\w) ((#\/ (#\2 #\. #\1 #\7))))))
                               ))

(report)
