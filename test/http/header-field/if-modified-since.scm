#!r6rs

(import (rnrs (6))
        (http header-field if-modified-since)
        (http assertion)
        (xunit))

(assert-parsing-successfully If-Modified-Since
                             "If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT"
                             `(,(string->list "If-Modified-Since")
                               #\:
                               (#\space)
                               ((#\S #\a #\t) #\, #\space ((#\2 #\9) #\space (#\O #\c #\t) #\space (#\1 #\9 #\9 #\4)) #\space ((#\1 #\9) #\: (#\4 #\3) #\: (#\3 #\1)) #\space (#\G #\M #\T))
                               ))

(report)
