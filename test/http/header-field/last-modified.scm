#!r6rs

(import (rnrs (6))
        (http header-field last-modified)
        (http assertion)
        (xunit))

(assert-parsing-successfully Last-Modified
                             "Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT"
                             `(,(string->list "Last-Modified")
                               #\:
                               (#\space)
                               ((#\T #\u #\e) #\, #\space ((#\1 #\5) #\space (#\N #\o #\v) #\space (#\1 #\9 #\9 #\4)) #\space ((#\1 #\2) #\: (#\4 #\5) #\: (#\2 #\6)) #\space (#\G #\M #\T))
                               ))

(report)
