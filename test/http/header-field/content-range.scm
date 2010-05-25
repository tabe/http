#!r6rs

(import (rnrs (6))
        (http header-field content-range)
        (http assertion)
        (xunit))

(assert-parsing-successfully Content-Range
                             "Content-Range: bytes 21010-47021/47022"
                             `(,(string->list "Content-Range")
                               #\:
                               (#\space)
                               ((#\b #\y #\t #\e #\s)
                                #\space
                                ((#\2 #\1 #\0 #\1 #\0) #\- (#\4 #\7 #\0 #\2 #\1))
                                #\/
                                (#\4 #\7 #\0 #\2 #\2))))

(report)
