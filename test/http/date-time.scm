#!r6rs

(import (rnrs (6))
        (http date-time)
        (http assertion)
        (xunit))

(assert-parsing-successfully HTTP-date
                             "Sun, 06 Nov 1994 08:49:37 GMT"
                             '((#\S #\u #\n) #\, #\space ((#\0 #\6) #\space (#\N #\o #\v) #\space (#\1 #\9 #\9 #\4)) #\space ((#\0 #\8) #\: (#\4 #\9) #\: (#\3 #\7)) #\space (#\G #\M #\T)))
(assert-parsing-successfully HTTP-date
                             "Sunday, 06-Nov-94 08:49:37 GMT"
                             '((#\S #\u #\n #\d #\a #\y) #\, #\space ((#\0 #\6) #\- (#\N #\o #\v) #\- (#\9 #\4)) #\space ((#\0 #\8) #\: (#\4 #\9) #\: (#\3 #\7)) #\space (#\G #\M #\T)))
(assert-parsing-successfully HTTP-date
                             "Sun Nov  6 08:49:37 1994"
                             '((#\S #\u #\n) #\space ((#\N #\o #\v) #\space (#\space (#\6))) #\space ((#\0 #\8) #\: (#\4 #\9) #\: (#\3 #\7)) #\space (#\1 #\9 #\9 #\4)))

(report)
