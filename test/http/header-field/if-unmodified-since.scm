#!r6rs

(import (rnrs (6))
        (http header-field if-unmodified-since)
        (http assertion)
        (xunit))

(assert-parsing-successfully If-Unmodified-Since
                             "If-Unmodified-Since: Sat, 29 Oct 1994 19:43:31 GMT"
                             `(,(string->list "If-Unmodified-Since")
                               #\:
                               (#\space)
                               ((#\S #\a #\t) #\, #\space ((#\2 #\9) #\space (#\O #\c #\t) #\space (#\1 #\9 #\9 #\4)) #\space ((#\1 #\9) #\: (#\4 #\3) #\: (#\3 #\1)) #\space (#\G #\M #\T))
                               ))

(report)
