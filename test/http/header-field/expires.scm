#!r6rs

(import (rnrs (6))
        (http header-field expires)
        (http assertion)
        (xunit))

(assert-parsing-successfully Expires
                             "Expires: Thu, 01 Dec 1994 16:00:00 GMT"
                             `(,(string->list "Expires")
                               #\:
                               (#\space)
                               ((#\T #\h #\u) #\, #\space ((#\0 #\1) #\space (#\D #\e #\c) #\space (#\1 #\9 #\9 #\4)) #\space ((#\1 #\6) #\: (#\0 #\0) #\: (#\0 #\0)) #\space (#\G #\M #\T))
                               ))

(report)
