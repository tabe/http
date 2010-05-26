#!r6rs

(import (rnrs (6))
        (http header-field date)
        (http assertion)
        (xunit))

(assert-parsing-successfully Date
                             "Date: Tue, 15 Nov 1994 08:12:31 GMT"
                             `(,(string->list "Date")
                               #\:
                               (#\space)
                               ((#\T #\u #\e) #\, #\space ((#\1 #\5) #\space (#\N #\o #\v) #\space (#\1 #\9 #\9 #\4)) #\space ((#\0 #\8) #\: (#\1 #\2) #\: (#\3 #\1)) #\space (#\G #\M #\T))
                               ))

(report)
