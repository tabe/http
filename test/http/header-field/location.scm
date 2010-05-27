#!r6rs

(import (rnrs (6))
        (http header-field location)
        (http assertion)
        (xunit))

(assert-parsing-successfully Location
                             "Location: http://www.w3.org/pub/WWW/People.html"
                             `(,(string->list "Location")
                               #\:
                               (#\space)
                               ((#\h (#\t #\t #\p)) #\: ((#\/ #\/) (() (#\w #\w #\w #\. #\w #\3 #\. #\o #\r #\g) ()) ((#\/ (#\p #\u #\b)) (#\/ (#\W #\W #\W)) (#\/ (#\P #\e #\o #\p #\l #\e #\. #\h #\t #\m #\l)))) ())
                               ))

(report)
